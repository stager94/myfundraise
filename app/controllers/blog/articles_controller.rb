class Blog::ArticlesController < ApplicationController

  layout "blog"

  impressionist

  def index
    @articles = Blog::Article.ordered.page params[:page]
  end

  def show
    @article = Blog::Article.find params[:id]
    @comments = @article.comments
    impressionist @article
  end

end
