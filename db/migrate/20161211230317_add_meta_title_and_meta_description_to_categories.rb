class AddMetaTitleAndMetaDescriptionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :meta_title, :string
    add_column :categories, :meta_description, :text
  end
end
