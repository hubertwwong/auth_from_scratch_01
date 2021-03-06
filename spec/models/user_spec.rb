require 'spec_helper'

describe User do
  
  describe 'validations' do
    context 'invalid credentials' do
      it 'of empty args should not validate' do
        a = User.new
        a.valid?.should == false
      end
    
      it 'of empty password field should not be valid' do
        a = User.new
        a.email = "foo@bar.com"
        a.valid?.should == false
      end

      it 'having a password confirmation that does not match should fail validation' do
        a = User.new
        a.email = "foo@bar.com"
        a.password = "zzz"
        a.password_confirmation = "yyy"
        a.valid?.should == false
      end
    end
    
    context 'valid credentials' do
      it 'should save correctly' do
        a = User.new
        a.email = "foo@bar.com"
        a.password = "zzz"
        a.valid?.should == true
      end
    end
    
    context 'dupes' do
      it 'should not be valid' do
        # creates a db user.
        db_user = create(:user)
      
        # checks to see if dupe validations work
        a = User.new
        a.email = "foo1@awesome.com"
        a.valid?.should == false
      end
    end
  end
  
  describe 'validations:create' do
    it 'should save 1 user' do
      initial_num_users = User.find(:all).length
      # creates a db user.
      db_user = create(:user)     
      User.find(:all).length.should == initial_num_users + 1
    end
    
    it 'be able to save multiple items' do
      # creates a db user.
      initial_num_users = User.find(:all).length
      db_user1 = create(:user)
      db_user2 = create(:user)
      
      User.find(:all).length.should == initial_num_users + 2
    end
  end
  
  describe 'associations' do
    before(:each) do
      @u = User.new
    end
    
    it 'has many users' do
      @u.should respond_to(:posts)
    end
  end
  
end
