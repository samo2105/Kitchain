ActiveAdmin.register Sale do

  index do
    column :id
    column :payed
    column :total
    column :created_at
    column :table
    column :office
    column :commerce
    column :worker
    column :state
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :total, :payed, :comment, :table_id, :office_id, :commerce_id, :worker_id, :state
  #
  # or
  #
  # permit_params do
  #   permitted = [:total, :payed, :comment, :table_id, :office_id, :commerce_id, :worker_id, :state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
