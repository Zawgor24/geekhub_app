Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users, only: [:show, :edit, :update] do
    resource :profile, except: [:index, :destroy]
  end

  root 'users#show'
end
