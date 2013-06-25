module Features
  
  # just a quick note.
  # the visit path points to the about page
  # there is a login prompt that is on the
  # top of the page and capybara gets confused
  # 
  # this is pointing to a static page.
  # its using the login at the top of the page.
  # layout is at layouts/navigation
  #
  # 
  
  module SessionHelpers
    def sign_up_with(email, password)
      visit landing_about_path
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Login'
    end

    # note that this is using factory girl
    # for the create thing.
    def sign_in
      user = create(:user)
      visit landing_about_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Login'
    end
  end
  
end