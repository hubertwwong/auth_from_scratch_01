require 'spec_helper'

describe SessionsController do
  describe "POST" do
    describe "create" do
      context "invalid attributes" do
        before(:each) do
          post :create, user: nil
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
          create(:user)   # create user in db so it can find it on the post request.
          post :create, user: attributes_for(:user)
        end
        
        it "session id should not be nil" do
          session[:user_id].should_not be_nil
        end
        
        it "should return a 200" do
          expect(response.status).to eq(200)
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
