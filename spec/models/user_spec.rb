require 'spec_helper'

describe User do
  
  describe 'validations' do
    it 'of empty args should not validate' do
      a = User.new
      a.valid?.should == false
    end
    
    it 'of empty password field should not be valid' do
      a = User.new
      a.email = "foo@bar.com"
      a.valid?.should == false
    end
    
    it 'having a username and password should pass' do
      a = User.new
      a.email = "foo@bar.com"
      a.password = "zzz"
      a.valid?.should == true
    end
    
    it 'having a password confirmation that does not match should fail validation' do
      a = User.new
      a.email = "foo@bar.com"
      a.password = "zzz"
      a.password_confirmation = "yyy"
      a.valid?.should == false
    end
    
    it 'dupe user should not be allowed' do
      # creates a db user.
      db_user = create(:user)
      
      # checks to see if dupe validations work
      a = User.new
      a.email = "foo1@awesome.com"
      a.valid?.should == false
    end
  end
  
  describe 'validations:create' do
    it 'should save 1 user' do
      # creates a db user.
      db_user1 = create(:user)
      
      User.find(:all).length.should == 1
    end
    
    it 'be able to save multiple items' do
      # creates a db user.
      db_user1 = create(:user)
      db_user2 = create(:user)
      
      User.find(:all).length.should == 2
    end
  end
  
end
