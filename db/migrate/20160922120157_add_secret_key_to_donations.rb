class AddSecretKeyToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :secret_key, :string
  end
end
