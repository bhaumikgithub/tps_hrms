require 'rails_helper'

RSpec.describe EmployeeHandbooksController, type: :controller do
  before :each do 
    @user = FactoryBot.create(:user, role_id: 1)
    sign_in @user
  end
  
  describe "GET #index" do 
    it "check http status code " do 
      get :index
      expect(response).to have_http_status(:success )   
    end
    it "should render the index.html.erb template " do
      get :index
      expect(response).to render_template("employee_handbooks/index")
    end
  end
end
