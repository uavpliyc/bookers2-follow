Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show, :index, :edit, :update]
    # member do
    #     get :following, :followers
    #   end
    # resource :relationships, only: [:create, :destroy]
  
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  root 'homes#top'
  get 'home/about' => 'homes#about'

end