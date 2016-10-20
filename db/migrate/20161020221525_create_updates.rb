class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :campaign, index: true, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
