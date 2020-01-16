Rails.application.routes.draw do
  

  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  get '/employee_designations' => 'home#employee_designation', :as => 'employee_designation'
  get '/add_leaves' => 'home#add_leave', :as => 'add_leave'
  get '/create_leave_report' => 'home#create_leave_report', :as => 'create_leave_report'

  devise_for :users#, :controllers => {:registrations => "users/registrations"}
  resources :roles
  resources :documents
  resources :users do
    member do
      patch :change_profile
      delete :remove_profile
      post :create_education_detail
      post :create_user_designation
    end
    collection do
      post :create_user
      get :birthday_anniversary
      get :user_data
      get :recurring_user_data
      get :edit_education_detail_modal
      delete :delete_education
      delete :delete_designation
      post :update_education
    end
  end
  
  resources :leaves do
    collection do
      get :get_events
      get :user_events
      get :leave_filter
      get :get_user_leaves
      get :get_mentor
      get :leave_report
      get :leave_report_filter
    end
  end

  resources :free_leaves
  resources :holidays do
    collection do
      get :holiday_filter
    end
  end
  resources :degrees
  resources :departments
  resources :designations
  resources :employee_handbooks
  get '/calender' => 'leaves#index', :as => 'calender'
  
end
