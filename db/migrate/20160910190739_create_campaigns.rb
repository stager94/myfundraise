class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :goal
      t.references :currency, index: true, foreign_key: true
      t.string :title
      t.attachment :photo
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.string :address
      t.boolean :enable_comments, default: true
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
