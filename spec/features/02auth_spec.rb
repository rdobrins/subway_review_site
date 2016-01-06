require 'spec_helper'
# User Authentication Tests

# [X] As a user I want to be able to sign in/out

feature 'sign in and sign out' do

  scenario 'user signs in with email and password' do
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password, match: :prefer_exact
    click_on 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end
  scenario 'user unsuccessfully signs in' do
    visit root_path
    user2 = FactoryGirl.create(:user)
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: 'passwordwrong', match: :prefer_exact
    click_on 'Log in'

    expect(page).to have_content("Invalid email or password.")
  end
  scenario 'signed in user signs out' do
    user3 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user3.email
    fill_in 'Password', with: user3.password, match: :prefer_exact
    click_on 'Log in'

    visit root_path
    click_link 'Sign Out'

    expect(page).to have_content("Signed out successfully.")
  end
end
