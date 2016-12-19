class User < ActiveRecord::Base
	TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :omniauthable,
				 :recoverable, :rememberable, :trackable, :validatable

	has_many :campaigns, dependent: :destroy
	has_many :identities, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :withdraws, through: :campaigns

  # has_many :activities, class_name: "::PublicActivity::Activity", as: :owner

	has_attached_file :foto, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  validates_presence_of :first_name, :last_name, :nick

  def activities
    PublicActivity::Activity.where recipient_type: "User", recipient_id: self.id
  end

  def has_vk_integration?
    identities.vk.any?
  end

  def has_ok_integration?
    identities.ok.any?
  end

  def self.anonym
    new first_name: "Anonym"
  end

	def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email
      user = User.where(email: email).first if email

      if user.nil?
        user = User.new(
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          address: auth.info.location,
          nick: (auth.info.nickname && auth.info.nickname.present? ? auth.info.nickname : auth.uid),
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )

        if identity.ok?
          foto_url = auth.extra.raw_info.pic_3 || auth.info.image
          user.address = [auth.extra.raw_info.location.countryName, auth.extra.raw_info.location.city].join(", ")
        end
        if identity.vk?
          foto_url = auth.extra.raw_info.photo_400_orig || auth.info.image
        end

        if foto_url.present?
          user.foto_from_url foto_url rescue nil
        end

        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def name
    [first_name, last_name].join(' ')
  end

  def foto_from_url(url)
    self.foto = URI.parse(url).open
  end

  def like?(object)
    object.likes.by_user(self).any?
  end

  # def activities
  #   PublicActivity::Activity.where owner_type: "User", owner_id: 8
  # end

end
