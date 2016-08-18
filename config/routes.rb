Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :books
  devise_for :admins
  devise_for :members
  resources :authors
  get 'votes/index'
  get 'authors/index'

resources :categories, only: [:show, :index]

end
