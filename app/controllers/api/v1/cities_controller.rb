class Api::V1::CitiesController < ApplicationController
	
  respond_to :json, :js

  def search
  	q = params[:q]
  	qt = Translit.convert q

  	# cities = City.where("name_ru ILIKE '#{q}%' OR name_en ILIKE '#{q}%' OR name_en ILIKE '#{qt}%'").limit(5)
  	cities = City.where("name_ru ILIKE :q OR name_en ILIKE :q OR name_en ILIKE :qt", q: "#{q}%", qt: "#{qt}%").limit(5)
    render json: cities.map {|c| { name: c.name, id: c.id, name_with_country: [c.name_ru, c.country.name].join(", ") } }
  end

end
