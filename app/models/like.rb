class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true

  scope :by_user, ->(user) { where user_id: user.id }

	after_create :update_campaigns_rating
	after_destroy :update_campaigns_rating

private

	def update_campaigns_rating
		likeable.reload
		likeable.update_rating
	end

end
