class Comment < ActiveRecord::Base

	include Likeable
	include ::PublicActivity::Model

  tracked only: [:create, :destroy], owner: :user, recipient: :commentable_author,
				  params: {
						subject_type: proc {|controller, model| model.commentable_type },
						subject_id: proc {|controller, model| model.commentable_id }
					}

	belongs_to :user
	belongs_to :commentable, polymorphic: true, counter_cache: true

	validates_presence_of :commentable, :user, :text

	after_create :update_campaigns_rating
	after_destroy :update_campaigns_rating


	def commentable_author
		commentable.user rescue nil
	end

private

	def update_campaigns_rating
		return if commentable_type != "Campaign" || commentable.nil?
		commentable.reload
		commentable.update_rating
	end

end
