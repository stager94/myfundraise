ActiveAdmin.register MenuItem do

	filter :title
	filter :link
	filter :is_enabled
	filter :position

	form do |f|
		inputs "Информация" do
			input :title
			input :link
			input :position
			input :is_enabled
		end

		actions
	end

	index do
		selectable_column
		id_column
		column :title
		column :link
		column :position
		column :is_enabled
		actions
	end

	show do
		attributes_table do
			row :id
			row :title
			row :link
			row :position
			row :is_enabled
		end
	end

end
