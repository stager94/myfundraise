class HomeController < ApplicationController
  def index
  	@body_class = "gray-striped homepage"
  	@campaigns = Campaign.includes(:currency, :category, :user, :likes).all.page(params[:page]).per(10)
  end
end
