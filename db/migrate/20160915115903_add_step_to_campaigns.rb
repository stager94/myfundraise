class AddStepToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :step, :string
  end
end
