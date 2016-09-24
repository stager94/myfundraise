class Donation < ActiveRecord::Base
  include AASM

  belongs_to :user
  belongs_to :campaign
  belongs_to :currency

  validates_presence_of :user, :campaign, :currency, :amount

  after_initialize :generate_secret_key!
  after_destroy :decrement_counters

  aasm do
  	state :pending, initial: true
  	state :paid
  	state :failed

  	event :pay, after: :increment_counters do
  		transitions from: [:pending, :failed], to: :paid
  	end

  	event :fail do
  		transitions from: :pending, to: :failed
  	end
  end

  def increment_counters
    total_amount = campaign.total_amount + self.amount
    campaign.update total_amount: total_amount,
                    percentage: (total_amount.to_f / campaign.goal * 100),
                    donations_count: (campaign.donations_count + 1)
  end

  def decrement_counters
    total_amount = campaign.total_amount - self.amount
    campaign.update total_amount: total_amount,
                    percentage: (total_amount.to_f / campaign.goal * 100),
                    donations_count: (campaign.donations_count - 1)
  end

private

  def generate_secret_key!
  	self.secret_key = Digest::MD5.hexdigest(Faker::Crypto.md5 + Time.now.to_i.to_s) unless secret_key
  end

end
