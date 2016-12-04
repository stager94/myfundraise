class CreateBlogArticles < ActiveRecord::Migration
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :snippet
      t.text :text
      t.integer :views_count, default: 0
      t.string :slug

      t.timestamps null: false
    end
  end
end
