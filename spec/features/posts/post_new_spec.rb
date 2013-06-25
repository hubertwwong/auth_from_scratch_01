require 'spec_helper'

feature 'post_new' do
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
    visit '/posts/new'
    
    # check if the page has a title and description
    expect(page).to have_text 'Title'
    expect(page).to have_text 'Description'
    
    fill_in 'post_title', with: 'some title'
    fill_in 'post_description', with: 'some description.'
    click_button 'Create Post'
    
  end
end