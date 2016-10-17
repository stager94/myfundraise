class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.json :params
      t.references :donation, index: true, foreign_key: true
      t.boolean :is_success, default: false
      t.boolean :is_failed, default: false

      t.timestamps null: false
    end
  end
end
