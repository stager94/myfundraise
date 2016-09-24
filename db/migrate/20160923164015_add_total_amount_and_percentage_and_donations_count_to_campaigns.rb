class AddTotalAmountAndPercentageAndDonationsCountToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :total_amount, :float, default: 0.0
    add_column :campaigns, :percentage, :float, default: 0.0
    add_column :campaigns, :donations_count, :integer, default: 0
  end
end
