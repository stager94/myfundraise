class CategoriesController < ApplicationController

	before_action :load_category

  def show
  	@body_class = "gray-striped"
  	@campaigns = @category.campaigns.active.page params[:page]
  end

private

	def load_category
		@category = Category.find params[:id]
	end

end
