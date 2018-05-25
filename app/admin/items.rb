ActiveAdmin.register Item do
  index do
    column :id
    column :name
    column :item_type
    column :price
    column :active
    column :image
    column "description" do |item|
      truncate(item.description, length: 10)
    end
    column :created_at
    column :updated_at

    #.....
  end
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

end
