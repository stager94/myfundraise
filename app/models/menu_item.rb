class MenuItem < ActiveRecord::Base

	acts_as_positioned

	scope :enabled, -> { where is_enabled: true }

end
