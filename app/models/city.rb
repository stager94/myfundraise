class City < ActiveRecord::Base

  translates :name

  belongs_to :country

end
