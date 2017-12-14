ActiveAdmin.register User do
  permit_params :email, :password

  form do |f|
    f.inputs 'Basic Details' do
      f.input :email
    end
    f.actions
  end

  controller do
    def create
      password = Faker::Internet.password(8)
      params[:user][:password] = password
      ExampleMailer.sample_email(params[:user][:email], password).deliver_now
      super
    end
  end
end
