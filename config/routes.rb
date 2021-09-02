Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'home#index'

  devise_scope :user do
    post 'users/sign_up', to: 'registrations#create', as: :create_registrations
    put 'users/edit', to: 'registrations#update', as: :edit_registrations
  end

  resources :profile, only: [:show], param: :username, path: '/'
end
