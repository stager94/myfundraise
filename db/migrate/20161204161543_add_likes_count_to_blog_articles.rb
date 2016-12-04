class AddLikesCountToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :likes_count, :integer, default: 0
    add_column :blog_articles, :comments_count, :integer, default: 0
  end
end
