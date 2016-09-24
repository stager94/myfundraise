class AddCoverPhotoToCategories < ActiveRecord::Migration
  def change
    add_attachment :categories, :cover
  end
end
