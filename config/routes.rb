Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users#, :controllers => {:registrations => "users/registrations"}
  resources :roles
  resources :users do
    collection do
      post :create_user
    end
  end
  resources :leaves
  resources :holidays

  
end
