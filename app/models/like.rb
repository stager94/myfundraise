class Like < ActiveRecord::Base

	include ::PublicActivity::Model

	tracked only: [:create, :destroy], owner: :user, recipient: :likeable_author,
					params: {
						subject_type: proc {|controller, model| model.likeable_type },
						subject_id: proc {|controller, model| model.likeable_id }
					}

	belongs_to :user
	belongs_to :likeable, polymorphic: true, counter_cache: true
	# has_one :likeable_author, through: :likeable, source: :user, source_type: "User"

	scope :by_user, ->(user) { where user_id: user.id }

	after_create :update_campaigns_rating
	after_destroy :update_campaigns_rating

	def likeable_author
		likeable.user rescue nil
	end

private

	def update_campaigns_rating
		return if likeable_type != "Campaign" || likeable.nil?
		likeable.reload
		likeable.update_rating
	end

end
