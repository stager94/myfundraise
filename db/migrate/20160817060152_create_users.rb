class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nick
      t.attachment :foto
      t.string :address

      t.timestamps null: false
    end
  end
end
