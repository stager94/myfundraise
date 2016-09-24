class AddCommentsCountToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :comments_count, :integer, default: 0

    Campaign.reset_column_information
    Campaign.find_each do |c|
    	Campaign.update_counters c.id, comments_count: c.comments.count
    end
  end
end
