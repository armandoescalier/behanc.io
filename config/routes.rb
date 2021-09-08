Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'home#index'

  devise_scope :user do
    post 'users/sign_up', to: 'registrations#create', as: :create_registrations
    put 'users/edit', to: 'registrations#update', as: :edit_registrations
  end

  resources :profile, only: [:show], param: :username, path: '/'

  post 'project/new', to: 'project#create', as: :create_project
  get 'projects/all', to: 'project#index', as: :projects_list
  patch 'project/:id/edit', to: 'project#update', as: :edit_project
  delete 'project/:id', to: 'project#destroy', as: :delete_project
  resources :project
end
