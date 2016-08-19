Rails.application.routes.draw do

  resources :comments
  root to: 'welcome#index'
  resources :books do
  	resources :votes, only: [:create, :update]
  end
  devise_for :admins
  devise_for :members
  resources :authors
  get 'votes/index'
  get 'authors/index'

resources :categories
end
