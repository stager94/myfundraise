class AddToWithdrawToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :to_withdraw, :integer, default: 0
    Campaign.all.find_each { |c| c.update to_withdraw: (c.donations.paid.sum(:amount) * 0.93) }
  end
end
