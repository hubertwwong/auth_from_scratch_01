# spec / support / spec_test_heloer.
# this is a controller helper.
module Controllers
  
  module SessionHelpers
    def login_default
      # create user in db.
      create(:user)
      post :create, sessions: attributes_for(:user)
      
      #puts session
      #puts "===="
      #puts session[:user]
      #puts "===="
      #puts session[:user_id]
      #puts "===="
      # user = User.where(:login => user.to_s).first if user_is_a?(Symbol)
      # request.session[:user] = user.id
    end
  end
  
end