class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.references :campaign, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
