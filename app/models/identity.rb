class Identity < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  scope :vk, -> { where provider: 'vkontakte' }
  scope :ok, -> { where provider: 'odnoklassniki' }

  def self.find_for_oauth(auth)
    o = find_or_create_by(uid: auth.uid, provider: auth.provider)
    o.update token: auth.credentials.token
    o
  end

  def ok?
  	provider == 'odnoklassniki'
  end

  def vk?
  	provider == 'vkontakte'
  end

  def instagram?
    provider == 'instagram'
  end

  def link
    if ok?
      "https://ok.ru/profile/#{uid}"
    elsif vk?
      "https://vk.com/id#{uid}"
    else
      "#"
    end
  end

end
