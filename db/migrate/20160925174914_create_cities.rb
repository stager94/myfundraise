class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name_ru
      t.string :name_en
      t.string :alias
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
