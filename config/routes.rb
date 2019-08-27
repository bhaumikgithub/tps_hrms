Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users#, :controllers => {:registrations => "users/registrations"}
  resources :roles
  resources :users do
    collection do
      post :create_user
    end
  end
  
  resources :leaves do
    get :get_events, on: :collection
  end
  resources :holidays
  get '/calender' => 'leaves#index', :as => 'calender'
  
end
