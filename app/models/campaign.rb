class Campaign < ActiveRecord::Base
  belongs_to :currency
  belongs_to :category
  belongs_to :user
end
