require 'spec_helper'

describe SessionsController do
  # create a db user so i can post to it later
  before(:all) do
    @user1 = create(:user)
    @user1_attr = {:email => @user1.email, :password => @user1.password}
  end
  
  describe "POST" do
    describe "create" do
      context "invalid attributes" do
        before(:each) do
          post :create
        end
        
        it "session id should be nil" do
          session[:user_id].should be_nil
        end
        
        it "should flash and error message" do
          flash[:error].should_not be_nil
        end

        it "should return 200" do
          expect(response.status).to eq(200)
        end
      end
      
      context "valid attributes" do
        before(:each) do
          post :create, @user1_attr
          #login_default
        end
        
        it "session id should not be nil" do
          session[:user_id].should_not be_nil
        end
        
        it "should return a 302 redirect" do
          expect(response.status).to eq(302)
        end
        
        it "redirects user back to another page" do
          response.should redirect_to root_url
        end        
      end
    end
  end
  
  describe "DELETE" do
    
  end
end
