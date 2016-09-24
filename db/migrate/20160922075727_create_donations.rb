class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :campaign, index: true, foreign_key: true
      t.float :amount
      t.references :currency, index: true, foreign_key: true
      t.text :message
      t.boolean :anonymous, default: false

      t.timestamps null: false
    end
  end
end
