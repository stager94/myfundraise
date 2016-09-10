class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.string :sign
      t.boolean :is_enabled, default: true

      t.timestamps null: false
    end
  end
end
