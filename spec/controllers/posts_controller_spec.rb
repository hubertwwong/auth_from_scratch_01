require 'spec_helper'

describe PostsController do
  
  describe "not logged in" do
    describe "GET #index" do
      before(:each) do
        get :index
      end
      
      it "should be 200" do
        expect(response.status).to eq(200)
      end
      
      it "should flash and error message" do
        flash[:error].should_not be_nil
      end
      
      it "current user should be nil" do
        session[:user_id].should be_nil
      end
      
      it "@post should be nil" do
        @post.should be_nil
      end
      
      it "@posts should be nil" do
        @posts.should be_nil
      end
    end
    
    describe "POST #create" do
      
    end
    
    describe "DESTROY #delete" do
      
    end
  end
  
end
