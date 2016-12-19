class AddUserInfoToWithdraws < ActiveRecord::Migration
  def change
    add_column :withdraws, :name, :string
    add_column :withdraws, :card_number, :string
  end
end
