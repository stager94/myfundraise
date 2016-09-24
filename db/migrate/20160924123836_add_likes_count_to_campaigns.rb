class AddLikesCountToCampaigns < ActiveRecord::Migration
	def change
		add_column :campaigns, :likes_count, :integer, default: 0

		Campaign.reset_column_information
		Campaign.find_each do |c|
			Campaign.update_counters c.id, likes_count: c.likes.count
		end
	end
end
