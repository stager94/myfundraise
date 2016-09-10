class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.string :link, default: '#'
      t.boolean :is_enabled, default: true

      t.timestamps null: false
    end
  end
end
