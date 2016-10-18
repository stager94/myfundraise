class AddSeenToPublicActivityActivities < ActiveRecord::Migration
  def change
    add_column :activities, :is_seen, :boolean, default: false
  end
end
