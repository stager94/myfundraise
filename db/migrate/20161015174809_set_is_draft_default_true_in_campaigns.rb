class SetIsDraftDefaultTrueInCampaigns < ActiveRecord::Migration
  def change
  	remove_column :campaigns, :is_draft
  	add_column :campaigns, :is_draft, :boolean, default: true
  end
end
