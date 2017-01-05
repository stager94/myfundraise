class Donation < ActiveRecord::Base
  paginates_per 10
  include AASM

  include ::PublicActivity::Model

  belongs_to :user
  belongs_to :campaign
  belongs_to :currency

  has_many :payments, dependent: :destroy

  validates_presence_of :campaign, :currency, :amount

  after_initialize :generate_secret_key!
  after_destroy :decrement_counters

  aasm do
  	state :pending, initial: true
  	state :paid
  	state :failed

  	event :pay, after: :increment_counters do
  		transitions from: [:pending, :failed], to: :paid, after: :after_pay_callback
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
    return unless paid?
    total_amount = campaign.total_amount - self.amount
    campaign.update total_amount: total_amount,
                    percentage: (total_amount.to_f / campaign.goal * 100),
                    donations_count: (campaign.donations_count - 1)
  end

  def author
    user || User.anonym
  end

  def after_pay_callback
    create_activity action: "create", recipient: campaign.user, owner: user
    campaign.update to_withdraw: (campaign.to_withdraw + self.amount * 0.93)
  end

private

  def generate_secret_key!
  	self.secret_key = Digest::MD5.hexdigest(Faker::Crypto.md5 + Time.now.to_i.to_s) unless secret_key
  end

end
