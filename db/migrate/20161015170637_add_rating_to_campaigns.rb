class AddRatingToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :rating, :float, default: 0.0
  end
end
