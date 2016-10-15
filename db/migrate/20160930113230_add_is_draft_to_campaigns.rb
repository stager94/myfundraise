class AddIsDraftToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :is_draft, :boolean
  end
end
