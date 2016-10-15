class HomeController < ApplicationController

	SORT_VARIANTS = %w(popular recent almost_there)
	DEFAULT_SORT = "popular"

  def index
  	@sorting = sorting
  	@body_class = "gray-striped homepage"
  	@campaigns = Campaign.active.includes(:currency, :category, :user, :likes).send(@sorting).page(params[:page]).per(9)
  end

private
	
	def sorting
		SORT_VARIANTS.include?(params[:sort]) ? params[:sort] : DEFAULT_SORT
	end

end
