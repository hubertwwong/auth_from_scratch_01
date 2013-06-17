require 'spec_helper'

describe Post do
  describe "validation" do
    context "invalid examples" do
      it "empty results should not be valid." do
        p = Post.new
        p.valid?.should be_false
      end
      
      it "empty title should not not be valid" do
        p = Post.new
        p.description = "foo"
        p.user_id = 1
        p.valid?.should be_false
      end
      
      it "empty description should not be valid" do
        p = Post.new
        p.title = "foo"
        p.user_id = 1
        p.valid?.should be_false
      end
      
      it "empty user id should not be valid." do
        p = Post.new
        p.title = "foo"
        p.description = "blah..."
        p.valid?.should be_false
      end
    end
    
    context "valid examples" do
      it "should save properly" do
        p = build(:post)
        p.valid?.should be_true
      end
    end
  end
  
  describe 'validations:create' do
    it 'should save 1 post' do
      # creates a db user.
      db_post = create(:post)
      
      Post.find(:all).length.should == 1
    end
    
    it 'be able to save multiple items' do
      # creates a db user.
      db_post1 = create(:post)
      db_post2 = create(:post)
      
      Post.find(:all).length.should == 2
    end
  end
  
  describe "associations" do
    before(:each) do
      @p = Post.new
    end
    
    it "should respond to user" do
      @p.should respond_to(:user)
    end
  end
end
