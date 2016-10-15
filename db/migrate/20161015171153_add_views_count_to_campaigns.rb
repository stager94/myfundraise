class AddViewsCountToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :views_count, :integer, default: 0
  end
end
