class AddShowAfterAmountToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :sign_after_amount, :boolean, default: false
  end
end
