Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'home#index'

  devise_scope :user do
    post 'users/sign_up', to: 'registrations#create', as: :create_registrations
    put 'users/edit', to: 'registrations#update', as: :edit_registrations
  end

  resources :profiles, only: [:show], param: :username, path: '/'

  resources :projects

  resources :projects do
    resources :likes
    resources :comments, only: %i[create destroy]
  end

  resources :follows, only: %i[create destroy]
end
