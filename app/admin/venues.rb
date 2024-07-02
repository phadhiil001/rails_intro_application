ActiveAdmin.register Venue do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :address, :capacity
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :capacity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :name, :address, :capacity

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :capacity
    actions
  end

  filter :name
  filter :address
  filter :capacity

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :capacity
    end
    f.actions
  end

end
