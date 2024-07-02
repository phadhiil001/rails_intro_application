ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :name, :email, :role

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role
    actions
  end

  filter :name
  filter :email
  filter :role

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :role, as: :select, collection: ['organizer', 'attendee']
    end
    f.actions
  end
end
