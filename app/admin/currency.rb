ActiveAdmin.register Currency do

	filter :code
	filter :name
	filter :is_enabled

	form do |f|
		inputs "Информация" do
			input :code
			input :name
			input :sign
			input :is_enabled
		end

		actions
	end

	index do
		selectable_column
		column :id
		column :code
		column :name
		column :sign do |c|
			c.sign.try :html_safe
		end
		column :is_enabled
		actions
	end

	show do
		attributes_table do
			row :id
			row :code
			row :name
			row :sign do
				currency.sign.try :html_safe
			end
			row :is_enabled
		end
	end

end
