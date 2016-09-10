class CategoriesController < ApplicationController

	before_action :load_category

  def show
  end

private
	
	def load_category
		@category = Category.find params[:id]
	end

end
