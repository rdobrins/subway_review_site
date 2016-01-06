require 'spec_helper'
# User Authentication Tests

# [X] As a user I want to be able to sign up

feature 'sign up' do

  scenario 'specifying valid and requird information' do
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: user1.first_name
    fill_in 'Last name', with: user1.last_name
    fill_in 'Email', with: "The" + user1.email
    fill_in 'Password', with: user1.password, match: :prefer_exact
    fill_in 'Password confirmation', with: user1.password
    click_on 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_on 'Sign up'

    expect(page).to have_content("Please review the problems below:")
  end
  scenario 'password confirmation does not match confirmation' do
    user2 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: user2.first_name
    fill_in 'Last name', with: user2.last_name
    fill_in 'Email', with: "The" + user2.email
    fill_in 'Password', with: user2.password, match: :prefer_exact
    fill_in 'Password confirmation', with: "user2.password"
    click_on 'Sign up'

    expect(page).to have_content("doesn't match Password")
  end
end
