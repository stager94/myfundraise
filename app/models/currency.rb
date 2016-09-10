class Currency < ActiveRecord::Base

	validates_presence_of :name, :code, :sign
	validates_uniqueness_of :name, :code

end
