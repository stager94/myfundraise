class Comment < ActiveRecord::Base

	include Likeable

	belongs_to :user
	belongs_to :commentable, polymorphic: true, counter_cache: true

	validates_presence_of :commentable, :user, :text

	after_create :update_campaigns_rating
	after_destroy :update_campaigns_rating

private

	def update_campaigns_rating
		commentable.reload
		commentable.update_rating
	end

end
