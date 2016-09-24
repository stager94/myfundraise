class AddSlugToCampains < ActiveRecord::Migration
  def change
    add_column :campaigns, :slug, :string
  end
end
