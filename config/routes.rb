Rails.application.routes.draw do
  
  root 'home#index'
  get '/employee_handbook' => 'home#employee_handbook', :as => 'employee_handbook'
  devise_for :users#, :controllers => {:registrations => "users/registrations"}
  resources :roles
  resources :users do
    collection do
      post :create_user
      get :birthday_anniversary
      get :user_data
    end
  end
  
  resources :leaves do
    collection do
      get :get_events
      get :user_events
    end
  end
  resources :holidays
  get '/calender' => 'leaves#index', :as => 'calender'
  
end
