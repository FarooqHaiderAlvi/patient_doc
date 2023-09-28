Rails.application.routes.draw do





  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  devise_for :users
  # here we write doctors not doctor because
  # doctors is controller name not doctor
  root 'doctors#dashboard'

  resource :doctor do
    member do
      get 'speciality'
    end
    member do
      get 'dashboard'
    end
  end

end
