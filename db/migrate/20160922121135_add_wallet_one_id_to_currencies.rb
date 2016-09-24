class AddWalletOneIdToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :wallet_one_id, :integer
    add_index :currencies, :wallet_one_id
  end
end
