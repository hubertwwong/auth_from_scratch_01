# spec / support / spec_test_heloer.
# this is a controller helper.
module Controllers
  
  module SessionHelpers
    # assumes a db created object from factory girl.
    # basically, you should be doing something like
    def helper_login(user)
      param = {:user => user.email, :password => user.password}
      post "session#create", param
    end
    
    # temp def for testing paths.
    def fooo
      "fooo"
    end
  end
  
end