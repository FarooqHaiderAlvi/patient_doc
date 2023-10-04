Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :doctors

  root 'doctors#dashboard'

  resources :doctors do
    resources :patients
  end

end
