ActiveAdmin.register City do

	filter :name_ru
	filter :name_en
	filter :alias
	filter :country

	index do
		selectable_column
		id_column
		column :name_ru
		column :name_en
		column :alias
		column :country
		actions
	end

	form do |f|
		f.inputs "Информация" do
			f.input :name_ru
			f.input :name_en
			f.input :alias
			f.input :country
		end

		actions
	end

end
