Rails.application.routes.draw do

  resources :comments
  root to: 'welcome#index'
  resources :books
  devise_for :admins
  devise_for :members
  get 'votes/index'
  get 'authors/index'

resources :categories, only: [:show, :index]

end
