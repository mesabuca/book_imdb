Rails.application.routes.draw do

  get 'rents/index'

  get 'rents/show'

  get 'rents/destroy'

  get 'rents/edit'

  get 'rents/update'

  get 'rents/new'

  root to: 'welcome#index'
  resources :books
  devise_for :admins
  devise_for :members
  resources :authors
  get 'votes/index'
  get 'authors/index'

resources :categories

end
