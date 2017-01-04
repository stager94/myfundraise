class Campaign < ActiveRecord::Base
  # acts_as_paranoid

  paginates_per 12

  mount_uploader :picture, Campaigns::CoverUploader

  extend FriendlyId

  include Likeable
  include Commentable
  include VideoHelper

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  is_impressionable counter_cache: true, column_name: :views_count, unique: :all

  friendly_id :friendly_code, use: [:slugged, :finders]

  scope :popular, -> { order rating: :desc }
  scope :recent, -> { order published_at: :desc }
  scope :almost_there, -> { order percentage: :desc }
  scope :active, -> { where is_draft: false }
  scope :drafts, -> { where is_draft: true }
  scope :successfull, -> { active.where percentage: 100 }
  scope :by_author, ->(user) { where user_id: user.id }
  scope :favourites, ->(user) { includes(:likes).where(likes: { user_id: user.id }).order "likes.created_at DESC" }
  scope :donations, ->(user) { includes(:donations).where donations: { user_id: user.id } }

	STEPS = [:general, :media, :media_crop, :media_confirm, :description, :share, :share_confirm, :activate]

  belongs_to :currency
  belongs_to :category
  belongs_to :user
  belongs_to :city

  has_many :donations, dependent: :destroy
  has_many :updates, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :withdraws, dependent: :destroy

  validates_presence_of :title, :currency, :goal, :user, :city
  validates_presence_of :description, if: :on_description_step?
  validates_numericality_of :goal, greater_than: 0

  after_initialize :set_default_currency
  after_create :update_slug!
  after_update :reprocess_photo
  before_update :set_published_at

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def embedded_video_url
    parse_video_url video_url
  end

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

  def on_description_step?
    current_step.to_s == "description"
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

  def set_published_at
    self.published_at = Time.now if is_draft_changed?
  end

end
