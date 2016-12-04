class HomeController < ApplicationController

	SORT_VARIANTS = %w(popular recent almost_there)
	DEFAULT_SORT = "popular"

  def index
  	@sorting = sorting
    @search = false
  	@body_class = "gray-striped homepage"
  	class_name = Campaign

  	q = params[:q]
  	qt = Translit.convert q if q.present?

  	if q && q.present?
  		class_name = Campaign.joins(:city).where("campaigns.title ILIKE :q OR cities.name_ru ILIKE :q OR cities.name_en ILIKE :q OR cities.name_en ILIKE :qt", q: "%#{q}%", qt: "%#{qt}%")
      @search = true
  	end
  	@campaigns = class_name.active.includes(:currency, :category, :user, :likes).send(@sorting).page(params[:page]).per(12)
  end

private

	def sorting
		SORT_VARIANTS.include?(params[:sort]) ? params[:sort] : DEFAULT_SORT
	end

end
