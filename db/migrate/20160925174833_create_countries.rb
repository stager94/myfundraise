class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name_ru
      t.string :name_en
      t.string :alias
      t.string :picture

      t.timestamps null: false
    end
  end
end
