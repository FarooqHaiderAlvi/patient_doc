ActiveAdmin.register Doctor do
   permit_params :type, :username, :password, :password_confirmation, :name

   # Customize the form for creating a new Doctor
   form do |f|
      f.inputs "Doctor Details" do
         f.input :type, as: :hidden, input_html: { value: "Doctor" }
         f.input :name
         f.input :username
         f.input :password, as: :password
         f.input :password_confirmation, as: :password

      end
      f.actions
   end
end
