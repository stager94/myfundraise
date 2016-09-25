ActiveAdmin.register User do

	filter :first_name
	filter :last_name
	filter :nick
	filter :email
	filter :address

	form do |f|
		inputs "Информация" do
			input :first_name
			input :last_name
			input :nick
			input :foto
			input :address
			input :email
			# input :password
		end

		actions
	end

	index do
		selectable_column
		id_column
		column :foto do |u|
			image_tag u.foto.url(:thumb), size: "50x50"
		end
		column :first_name
		column :last_name
		column :nick
		column :email
		column :created_at do |u|
			u.created_at.strftime "%d.%m.%Y %H:%M"
		end
		actions
	end

	show do
		attributes_table do
			row :id
			row :email
			row :first_name
			row :last_name
			row :nick
			row :address
			row :created_at
			row :foto do
				image_tag user.foto.url :medium
			end
		end
	end

end
