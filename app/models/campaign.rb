class Campaign < ActiveRecord::Base
  extend FriendlyId
  
  include Likeable
  include Commentable

  is_impressionable

  friendly_id :friendly_code, use: [:slugged, :finders]

	STEPS = [:media, :description, :share, :link]

  belongs_to :currency
  belongs_to :category
  belongs_to :user
  belongs_to :city

  has_many :donations

  validates_presence_of :title, :currency, :goal, :user, :city
  validates_numericality_of :goal, greater_than: 0

  after_initialize :set_default_currency
  after_create :update_slug!

  has_attached_file :photo, processors: [:watermark], styles: { 
    medium: "600x600#",
    thumb: "300x300#", 
    cover: "600x400#", 
    cover_lg: { geometry: "1500x800#", watermark_path: "#{Rails.root}/public/logo.png" }
  }, default_url: "/images/campaigns/:style/missing.jpg"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/   

  def address
    return unless city
    [city.name, city.country.try(:name)].join ", "
  end

  def photo_from_url(url)
  	self.photo = URI.parse(url) rescue nil
  	save
  end

  def current_step
  	step || STEPS.first
  end

  def next_step
  	STEPS[STEPS.index(current_step)+1] rescue nil
  end

  def next_step!
  	update step: next_step
  end

  def update_slug!
    update slug: nil
  end

private

  def set_default_currency
  	self.currency = Currency.first unless currency
  end

  def friendly_code
    "#{id} #{title}"
  end

end
