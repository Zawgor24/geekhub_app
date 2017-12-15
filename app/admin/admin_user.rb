ActiveAdmin.register AdminUser do
  before_action :authenticate_admin_user!
  permit_params :email, :password, :password_confirmation, profile_attributes: [
                                                            :avatar, :first_name, 
                                                            :last_name, :age, :id
                                                          ]

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
