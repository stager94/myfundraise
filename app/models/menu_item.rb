class MenuItem < ActiveRecord::Base

	acts_as_positioned

	validates_uniqueness_of :title

	scope :enabled, -> { where is_enabled: true }

end
