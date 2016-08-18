Rails.application.routes.draw do

  devise_for :admins
  devise_for :members

  get 'votes/index'
  resources :books
  get 'authors/index'
  root to: 'welcome#index'

resources :categories, only: [:show, :index]

end
