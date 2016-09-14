class Campaign < ActiveRecord::Base
  belongs_to :currency
  belongs_to :category
  belongs_to :user

  validates_presence_of :title, :address, :currency, :goal, :user

  after_initialize :set_default_currency

private

  def set_default_currency
  	self.currency = Currency.first
  end

end
