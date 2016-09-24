class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :commentable_id
      t.string :commentable_type
      t.text :text
      t.integer :likes_count, default: 0

      t.timestamps null: false
    end
  end
end
