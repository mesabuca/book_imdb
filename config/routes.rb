Rails.application.routes.draw do


  root to: 'welcome#index'


  resources :books do
  	resources :comments
  	resources :votes, only: [:create, :update]
    collection do
      get :top_books
    end
  end


  devise_for :admins
  devise_for :members
  resources :authors
  resources :categories
  resources :rents
end
