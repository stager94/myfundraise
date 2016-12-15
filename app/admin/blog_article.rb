ActiveAdmin.register Blog::Article do

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

  form do |f|
    f.inputs "General" do
      f.input :title
      f.input :slug
    end

    f.inputs "Text" do
      f.input :text, label: false
    end

    f.inputs "Snippet" do
      f.input :snippet, label: false
    end

    f.actions
  end

end
