ActiveAdmin.register Category do

	filter :title
	filter :full_title
	filter :slug
	filter :popular

	form do |f|
		inputs "Информация" do
			input :title
			input :full_title
			input :slug
			input :foto
			input :cover
			input :description
			input :popular
		end

		inputs "SEO" do
			input :meta_title
			input :meta_description
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
		column :full_title
		column :slug
		column :description
		column :popular
		actions
	end

	show do
		attributes_table do
			row :id
			row :title
			row :full_title
			row :slug
			row :description
			row :popular
			row :foto do
				image_tag category.foto.url :small
			end
		end
	end

end
