ActiveAdmin.register Campaign do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	filter :currency
	filter :category
	filter :user
	filter :title
	filter :city
	filter :is_active
	filter :enable_comments
	filter :goal
	filter :total_amount
	filter :percentage

	form do |f|
		inputs "Информация" do
			input :currency
			input :category
			input :user
			input :goal
			input :title
			input :photo, as: :file
			input :description
			input :city
			input :enable_comments
			input :is_active
		end
		
		actions
	end

	index do
		selectable_column
		id_column
		column :category
		column :user
		column :title
		column :currency
		column :goal
		column :is_active
		actions
	end

end
