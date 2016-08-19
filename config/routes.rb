Rails.application.routes.draw do

  resources :comments
  root to: 'welcome#index'


  resources :books do
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



  resources :categories, only: [:show, :index]



end
