class AddNameAndEmailToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :name, :string
    add_column :donations, :email, :string
  end
end
