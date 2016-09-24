class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true

  scope :by_user, ->(user) { where user_id: user.id }
end
