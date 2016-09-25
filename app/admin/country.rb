ActiveAdmin.register Country do

	filter :name_ru
	filter :name_en
	filter :alias
	filter :picture

	index do
		selectable_column
		id_column
		column :name_ru
		column :name_en
		column :alias
		column :picture do |c|
			image_tag "/images/flags/#{c.picture}.png", style: "height:20px;"
		end
		column :cities_count do |c|
			c.cities.count
		end
		actions
	end

	form do |f|
		f.inputs "Информация" do
			f.input :name_ru
			f.input :name_en
			f.input :alias
			f.input :picture
		end

		actions
	end


end
