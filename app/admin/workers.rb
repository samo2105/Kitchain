ActiveAdmin.register Worker do

  index do
    column :id
    column :email
    column :name
    column :created_at
    actions
  end

  form do |f|
    inputs 'Agregar un nuevo worker' do
      input :name
      input :email
      input :rol
      input :adress
      input :password
      input :password_confirmation
      input :commerce
    end
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :rol, :adress, :number, :admin, :email, :password, :password_confirmation, :commerce_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :rol, :adress, :number, :admin, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :commerce_id, :office_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
