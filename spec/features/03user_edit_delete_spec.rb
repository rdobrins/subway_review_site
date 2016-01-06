require 'spec_helper'
# User Authentication Tests

# [X] As a user I want to be able to edit/delete my info

feature 'user edits/deletes info' do
  before(:each) do
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password, match: :prefer_exact
    click_on 'Log in'
  end

  scenario 'user edits user info successfully' do
    click_on 'Edit Info'
    fill_in 'Email', with: "newemail@gmail.com"
    fill_in "Current password", with: "Iambobsaget"
    click_on 'Update'
    expect(page).to have_content("Your account has been updated successfully.")
    expect(User.first.email).to eq("newemail@gmail.com")
  end
  scenario 'user deletes user info successfully' do
    click_on 'Edit Info'
    click_link 'Cancel my account'
    expect(page).to have_content("Your account has been successfully cancelled")
    expect(User.first).to eq(nil)
  end
end
