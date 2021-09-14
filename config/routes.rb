Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'home#index'

  devise_scope :user do
    post 'users/sign_up', to: 'registrations#create', as: :create_registrations
    put 'users/edit', to: 'registrations#update', as: :edit_registrations
  end

  resources :profiles, only: [:show], param: :username, path: '/'

  resources :projects

  resources :users do
    member do
      post 'follow'
      post 'unfollow'
    end
  end
end
