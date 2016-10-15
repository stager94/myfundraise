class Campaign < ActiveRecord::Base

  mount_uploader :picture, Campaigns::CoverUploader

  extend FriendlyId
  
  include Likeable
  include Commentable

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  is_impressionable counter_cache: true, column_name: :views_count, unique: true

  friendly_id :friendly_code, use: [:slugged, :finders]

  scope :popular, -> { order rating: :desc }
  scope :recent, -> { order created_at: :desc }
  scope :almost_there, -> { order percentage: :desc }
  scope :active, -> { where is_draft: false }

	STEPS = [:media, :media_crop, :media_confirm, :description, :activate]

  belongs_to :currency
  belongs_to :category
  belongs_to :user
  belongs_to :city

  has_many :donations

  validates_presence_of :title, :currency, :goal, :user, :city
  validates_numericality_of :goal, greater_than: 0

  after_initialize :set_default_currency
  after_create :update_slug!
  after_update :reprocess_photo

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def address
    return unless city
    [city.name, city.country.try(:name)].join ", "
  end

  def current_step
  	step || STEPS.first
  end

  def next_step
    count = 1
    count = 3 if current_step.to_sym == :media && !self.picture.present?
  	STEPS[STEPS.index(current_step.to_sym)+count] rescue nil
  end

  def prev_step
    STEPS[STEPS.index(current_step.to_sym)-1] rescue STEPS.first
  end

  def next_step!
  	update step: next_step
  end

  def prev_step!
    update step: prev_step
  end

  def update_slug!
    update slug: nil
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def update_rating
    update rating: recalculate_rating
  end

private

  def recalculate_rating
    views_count * 0.2 + likes_count * 0.3 + comments_count * 0.5
  end

  def set_default_currency
  	self.currency = Currency.first unless currency
  end

  def friendly_code
    "#{id} #{title}"
  end

  def reprocess_photo
    picture.recreate_versions! if crop_x.present?
  end

end
