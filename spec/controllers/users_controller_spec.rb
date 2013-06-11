require 'spec_helper'

describe UsersController do
  
  describe "GET" do
    describe "new" do
      before(:each) do
        get :new
      end
      
      it "should assigns a new User to @user" do
        assigns(:user).should_not == nil
      end
      
      it "should return a 200" do
        expect(response.status).to eq(200)
      end
      
      it "should return a page" do
        expect(response).to render_template("new")
      end
    end
  end
  
  # note that this is busted.
  describe "POST" do
    describe "create" do
      context "invalid attributes" do
        before(:each) do
          post :create, user: nil
        end
          
        it "should flash and error message" do
          flash[:error].should_not be_nil
        end
          
        it "should return 200" do
          expect(response.status).to eq(200)
        end
      end
      
      context "valid attributes" do
        it "increments user count by 1" do
          expect{
            post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end
        
        it "should return a 200" do
          expect(response.status).to eq(200)
        end
        
        it "redirects user back to another page" do
          post :create, user: attributes_for(:user)
          response.should redirect_to root_url
        end
      end
    end
  end
  
end
