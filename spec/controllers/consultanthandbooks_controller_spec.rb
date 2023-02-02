require 'rails_helper'

RSpec.describe ConsultantHandbooksController, type: :controller do
  before :each do 
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  
  describe "GET #index" do 
    it "check http status code " do 
      get :index
      puts "This is working role id #{@user.role_id} here is user type #{@user.user_type}"
      if consultant_and_admin_rights?
        expect(response).to have_http_status(:success )  
      else
        expect(response).to have_http_status(:redirect)
      end
    end
    it "should render the index.html.erb template " do
      get :index
      if consultant_and_admin_rights?
        expect(response).to render_template("consultant_handbooks/index")
      else
        expect(response).not_to render_template("consultant_handbooks/index")
      end
    end
  end
end
