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


<<<<<<< HEAD

  resources :categories, only: [:show, :index]

=======
resources :categories
resources :rents
>>>>>>> 5a90e8f95c8480b346d0430c3692ea9a4efde801


end
