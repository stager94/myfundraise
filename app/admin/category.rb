ActiveAdmin.register Category do

	filter :title
	filter :slug
	filter :popular

	form do |f|
		inputs "Информация" do
			input :title
			input :slug
			input :foto
			input :description
			input :popular
		end

		actions
	end

	index do
		selectable_column
		column :id
		column :foto do |c|
			image_tag c.foto.url(:small), size: "24x24"
		end
		column :title
		column :slug
		column :description
		column :popular
		actions
	end

	show do
		attributes_table do
			row :id
			row :title
			row :slug
			row :description
			row :popular
			row :foto do
				image_tag category.foto.url :small
			end
		end
	end

end
