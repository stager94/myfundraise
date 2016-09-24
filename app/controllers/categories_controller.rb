class CategoriesController < ApplicationController

	before_action :load_category

  def show
  	@body_class = "gray-striped"
  	@campaigns = @category.campaigns
  end

private
	
	def load_category
		@category = Category.find params[:id]
	end

end
