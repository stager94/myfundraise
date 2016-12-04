class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :campaign, index: true, foreign_key: true
      t.integer :amount, default: 1
      t.text :description

      t.timestamps null: false
    end
  end
end
