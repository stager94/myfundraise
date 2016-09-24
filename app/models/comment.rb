class Comment < ActiveRecord::Base

	include Likeable

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  validates_presence_of :commentable, :user, :text
end
