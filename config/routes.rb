Rails.application.routes.draw do
  get 'appointments/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :doctors

  root 'doctors#dashboard'

  get 'patients/doctors_patients'

  resources :doctors do
    resources :appointments
    resources :patients do
      resources :appointments
    end
  end

end
