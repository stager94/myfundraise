class AddFullTitleToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :full_title, :string
  end
end
