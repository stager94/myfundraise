ActiveAdmin.register Currency do

	filter :code
	filter :name
	filter :is_enabled
	filter :wallet_one_id
	filter :sign_after_amount

	form do |f|
		inputs "Информация" do
			input :code
			input :name
			input :wallet_one_id
			input :sign
			input :sign_after_amount
			input :is_enabled
		end

		actions
	end

	index do
		selectable_column
		id_column
		column :code
		column :name
		column :wallet_one_id
		column :sign do |c|
			c.sign.try :html_safe
		end
		column :sign_after_amount
		column :is_enabled
		actions
	end

	show do
		attributes_table do
			row :id
			row :code
			row :name
			row :wallet_one_id
			row :sign do
				currency.sign.try :html_safe
			end
			row :sign_after_amount
			row :is_enabled
		end
	end

end
