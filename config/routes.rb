Rails.application.routes.draw do
  resources :books
  get 'authors/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
