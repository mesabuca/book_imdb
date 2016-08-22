Rails.application.routes.draw do


  root to: 'welcome#index'


  resources :books do
    resources :rents
  	resources :comments
  	resources :votes, only: [:create, :update]
    collection do
      get :top_books
    end
  end


  devise_for :admins
  devise_for :members
  resources :authors
  get 'votes/index'
  get 'authors/index'


resources :categories
resources :rents

end
