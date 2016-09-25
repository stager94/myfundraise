class Country < ActiveRecord::Base

  translates :name

  has_many :cities

  scope :by_name, ->(name) { where("name_en = ? OR name_ru = ?", name, name).first }

end
