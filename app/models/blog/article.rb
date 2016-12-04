class Blog::Article < ActiveRecord::Base

  paginates_per 10

  extend FriendlyId
  include Likeable
  include Commentable

  is_impressionable counter_cache: true, column_name: :views_count, unique: :all

  friendly_id :friendly_code, use: [:slugged, :finders]

  after_create :update_slug!

  scope :ordered, ->{ order created_at: :desc }
  scope :popular, ->{ order views_count: :desc }

  private

  def friendly_code
    "#{id} #{title}"
  end

  def update_slug!
    update slug: nil
  end

end
