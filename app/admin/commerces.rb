ActiveAdmin.register Commerce do

  index do
    column :id
    column :email
    column :name
    column :created_at
    actions
  end

  form do |f|
    inputs 'Agregar un nuevo commerce' do
      input :name
      input :email
      input :rol
      input :adress
      input :password
      input :password_confirmation
    end
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :adress, :number, :rol, :email, :password, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :adress, :number, :rol, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
