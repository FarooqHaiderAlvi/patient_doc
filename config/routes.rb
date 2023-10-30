Rails.application.routes.draw do
  get 'appointments/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :doctors

  root 'doctors#dashboard'
  get 'patients/doctors_patients'

  resources :appointments do
    resources :visits
  end

  resources :prescriptions do
    resources :medicines
  end

  resources :visits do
    resources :prescriptions
  end

  resources :doctors do
    resources :appointments
    resources :patients do
      resources :appointments
    end
  end

end
