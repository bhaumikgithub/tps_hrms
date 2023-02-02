require 'rails_helper'

RSpec.describe VendorsController, type: :controller do
  before :each do 
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  
  describe "GET #index" do 
    it "check http status code " do 
      get :index
      if admin_rights?
        expect(response).to have_http_status(:success ) 
      else
        expect(response).to have_http_status(:redirect ) 
      end
    end
    it "should render the index.html.erb template " do
      get :index
      if admin_rights?
        expect(response).to render_template("vendors/index")
      else
        expect(response).not_to render_template("vendors/index")
      end
    end
  end
end
