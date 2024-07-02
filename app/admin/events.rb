ActiveAdmin.register Event do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :start_time, :end_time, :user_id, :venue_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :start_time, :end_time, :user_id, :venue_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  permit_params :title, :description, :start_time, :end_time, :user_id, :venue_id, :image, category_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :start_time
    column :end_time
    column :user
    column :venue
    actions
  end

  filter :title
  filter :description
  filter :start_time
  filter :end_time
  filter :user
  filter :venue

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :start_time, as: :datetime_picker
      f.input :end_time, as: :datetime_picker
      f.input :user
      f.input :venue
      f.input :image, as: :file
      f.input :categories, as: :check_boxes
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :start_time
      row :end_time
      row :user
      row :venue
      row :image do |event|
        image_tag event.image if event.image.attached?
      end
      row :categories do |event|
        event.categories.map(&:name).join(', ')
      end
    end
    active_admin_comments
  end
end
