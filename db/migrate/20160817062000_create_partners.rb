class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :title
      t.attachment :foto
      t.string :link

      t.timestamps null: false
    end
  end
end
