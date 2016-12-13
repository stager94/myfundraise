class CreateCustomQuestions < ActiveRecord::Migration
  def change
    create_table :custom_questions do |t|
      t.string :email
      t.text :text

      t.timestamps null: false
    end
  end
end
