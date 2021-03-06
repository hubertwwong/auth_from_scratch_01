require 'spec_helper'

feature 'post_index' do
  scenario "not logged in" do
    visit '/posts'
    expect(page).to have_text('You must be logged in')
    expect(page).not_to have_text('Title')
  end
  
  scenario 'logged in' do
    # load a user into db.
    #@user1 = create(:user)
    #@user1_attr = {:email => @user1.email, :password => @user1.password}
    sign_in
    visit '/posts'
    
    # check whats on the page.
    expect(page).to have_text('create a new post')
    
    # check if new link works.
    click_link 'create a new post'
    expect(page).to have_text 'Title'
  end
end