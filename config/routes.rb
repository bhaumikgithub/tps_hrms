Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  get '/designations' => 'home#employee_designation', :as => 'employee_designation'
  get '/add_leaves' => 'home#add_leave', :as => 'add_leave'

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
  resources :employee_handbooks
  get '/calender' => 'leaves#index', :as => 'calender'
  
end
