require 'spec_helper'
# User Authentication Tests

# [X] As a user I want to be able to sign up

feature 'sign up' do

  scenario 'specifying valid and requird information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Sebastian'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'newton@issac.law'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password'
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
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Sebastian'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'newton1@issac.law'
    fill_in 'Password', with: 'password1', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password2'
    click_on 'Sign up'

    expect(page).to have_content("doesn't match Password")
  end
end
