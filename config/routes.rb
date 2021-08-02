Rails.application.routes.draw do

  resources :contacts, only: [:new, :create]

  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  get '/employee_designations' => 'home#employee_designation', :as => 'employee_designation'
  get '/add_leaves' => 'home#add_leave', :as => 'add_leave'
  get '/create_leave_report' => 'home#create_leave_report', :as => 'create_leave_report'

  devise_for :users#, :controllers => {:registrations => "users/registrations"}
  resources :roles do
    member do
     get :add_permission
     post :create_permission
    end
  end
  resources :documents
  resources :projects
  resources :user_reports
  resources :event_managements do
    member do
      get :edit_session
      patch :update_session
      delete :delete_session
    end
    collection do
      get :add_session
      post :create_session
    end
  end
  resources :users do
    member do
      patch :change_profile
      delete :remove_profile
      post :create_education_detail
      post :create_user_designation
      get :activation
      get :generate_designation_pdf
      get :withdraw_resignation 
    end
    collection do
      post :create_user
      get :birthday_anniversary
      get :user_data
      get :recurring_user_data
      get :edit_education_detail_modal
      get :edit_user_designation_modal
      get :edit_resign_model
      delete :delete_education
      delete :delete_designation
      post :update_education
      post :update_user_designation
      patch :update_resign_user
      get :job_status_filter
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
  resources :event_links
  resources :designations
  resources :credential_types
  resources :event_categories
  resources :credentials
  resources :vendors
  resources :bills do
    member do
      delete :purge_file
    end
  end
  resources :asset_types
  resources :assets, :path => "/admin/assets"
  resources :asset_histories do
    collection do
      get :filter_date
    end
  end
  resources :employee_handbooks do
    collection do
      patch :sort
    end
  end
  get '/calender' => 'leaves#index', :as => 'calender'
  
end
