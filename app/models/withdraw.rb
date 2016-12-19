class Withdraw < ActiveRecord::Base

  include AASM

  belongs_to :campaign

  after_create :after_create_callback

  validates :name, :card_number, :amount, presence: true

  def after_create_callback
    campaign.update to_withdraw: (campaign.to_withdraw - self.amount)
    CustomMailer.withdraw(self.id).deliver_now
  end

  aasm do
    state :pending, initial: true
    state :paid
    state :failed

    event :pay do
      transitions from: [:pending, :failed], to: :paid
    end

    event :fail do
      transitions from: :pending, to: :failed
    end
  end

end
