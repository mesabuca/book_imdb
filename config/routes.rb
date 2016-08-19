Rails.application.routes.draw do


  root to: 'welcome#index'
  resources :books do
    resources :rents
  end
  devise_for :admins
  devise_for :members
  resources :authors
  get 'votes/index'
  get 'authors/index'

resources :categories


end
