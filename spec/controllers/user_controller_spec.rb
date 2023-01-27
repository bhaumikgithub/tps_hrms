require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do 
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  describe "GET #index" do 
    it "check http status code" do 
      get :index
      expect(response).to have_http_status(:success)
    end
    
  end
  describe "GET #new" do 
    it "true when normal user try to create user and redirect the page" do 
      get :new
      if @user.role_id != 1
        expect(response).to have_http_status(:redirect)
        
      end
    end
  end
  describe "GET #create" do
    it "check user is created and it is saved to db or not " do
      if @user.save 
        expect(User.last.first_name).to eq(@user.first_name)
      else 
        expect(response).to render_template('users/new')
      end
    end
  end
  
 
  describe "GET #birthday_anniversary" do 
    it "check show page rendered in users controller" do 
      get :birthday_anniversary 
      expect(response).to render_template('users/birthday_anniversary')
    end
  end 

  
end
