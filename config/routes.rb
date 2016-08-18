Rails.application.routes.draw do

  get 'votes/index'
  resources :books
  get 'authors/index'
  root to: 'welcome#index'


resources :categories, only: [:show, :index] do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
