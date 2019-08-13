Rails.application.routes.draw do
  
  root 'home#index'
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :roles
  resources :users
  resources :leaves


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
