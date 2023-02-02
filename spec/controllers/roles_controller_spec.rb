require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  before :each do 
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  
  describe "GET #index" do 
    it "check http status code " do 
      get :index
      expect(response).to have_http_status(:success )   
    end
    it "should render the index.html.erb template  " do
      get :index
      expect(response).to render_template("roles/index")
    end
  end
end
