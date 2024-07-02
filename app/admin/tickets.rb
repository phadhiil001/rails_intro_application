ActiveAdmin.register Ticket do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :event_id, :user_id, :ticket_type, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:event_id, :user_id, :ticket_type, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :event_id, :user_id, :ticket_type, :price

  index do
    selectable_column
    id_column
    column :event
    column :user
    column :ticket_type
    column :price
    actions
  end

  filter :event
  filter :user
  filter :ticket_type
  filter :price

  form do |f|
    f.inputs do
      f.input :event
      f.input :user
      f.input :ticket_type, as: :select, collection: ['VIP', 'General', 'Early Bird']
      f.input :price
    end
    f.actions
  end

end
