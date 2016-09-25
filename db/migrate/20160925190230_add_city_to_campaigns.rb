class AddCityToCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :city, index: true, foreign_key: true
  end
end
