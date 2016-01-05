require 'spec_helper'
# User Authentication Tests

# [X] As a user I want to be able to sign up

feature 'sign in and sign out' do

  scenario 'user signs in with email and password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'newton@issac.law'
    fill_in 'Password', with: 'password', match: :prefer_exact
    # fill_in 'Password confirmation', with: 'password'
    click_on 'Log in'

    expect(page).to have_content("Signed in successfully.")
  end
  scenario 'user unsuccessfully signs in' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'newton@issac.law'
    fill_in 'Password', with: 'passwordwrong', match: :prefer_exact
    # fill_in 'Password confirmation', with: 'password'
    click_on 'Log in'

    expect(page).to have_content("Invalid email or password.")
  end
  scenario 'signed in user attempts to sign in' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'newton@issac.law'
    fill_in 'Password', with: 'password', match: :prefer_exact
    # fill_in 'Password confirmation', with: 'password'
    click_on 'Log in'

    visit root_path
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end
  scenario 'signed in user signs out' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'newton@issac.law'
    fill_in 'Password', with: 'password', match: :prefer_exact
    # fill_in 'Password confirmation', with: 'password'
    click_on 'Log in'

    visit root_path
    click_link 'Sign Out'

    expect(page).to have_content("Signed out successfully.")
  end
end
