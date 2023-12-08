Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"
  
  
  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :following, :followers
    end
    resource :relationship, only: [:create, :destroy]
  end
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy] 
    resource :favorite, only: [:create, :destroy]
  
  end
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  
  get "/search" => "searches#search" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
