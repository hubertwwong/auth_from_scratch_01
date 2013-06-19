require 'spec_helper'

feature 'post_index' do
  scenario "user vists without logging in" do
    visit '/posts'
    expect(page).to have_text('You must be logged in')
  end
  
  scenario "user visits after logging in" do
    sign_in
    visit '/posts'
    
    expect(page).to have_text('pending')
  end
end