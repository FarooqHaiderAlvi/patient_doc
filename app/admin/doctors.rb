ActiveAdmin.register Doctor do
  permit_params :email, :password, :password_confirmation, :name
  # Customize the form for creating a new Doctor
  form do |f|
    f.inputs "Doctor Details" do

      f.input :name
      f.input :email
      f.input :password, as: :password
      f.input :password_confirmation, as: :password
    end
    f.actions
  end
end
