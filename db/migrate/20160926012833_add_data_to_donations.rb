class AddDataToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :data, :json
  end
end
