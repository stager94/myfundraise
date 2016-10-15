class AddWidthAndHeightToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :width, :integer, default: 0
    add_column :campaigns, :height, :integer, default: 0
  end
end
