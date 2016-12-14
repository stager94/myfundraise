class Withdraw < ActiveRecord::Base
  belongs_to :campaign

  after_create :after_create_callback

  def after_create_callback
    campaign.update to_withdraw: (campaign.to_withdraw - self.amount)
    CustomMailer.withdraw(self.id).deliver_now
  end
end
