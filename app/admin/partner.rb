ActiveAdmin.register Partner do

	filter :title
	filter :link

	form do |f|
		inputs "Информация" do
			input :title
			input :foto
			input :link
		end

		actions
	end

	index do
		selectable_column
		id_column
		column :foto do |p|
			image_tag p.foto.url(:thumb), height: "20"
		end
		column :title
		column :link
		actions
	end

	show do
		attributes_table do
			row :id
			row :title
			row :link
			row :foto do
				image_tag partner.foto.url :thumb
			end
		end
	end

end
