require 'spec_helper'
# able to add reviews to a specific stations

# [X] As a user I want to be able add a review to a station

feature 'view station page with review button and go to review page' do

  scenario 'going to station show page and seeing add review link' do
    station3 = FactoryGirl.create(:station)
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button "Log in"
    click_link station3.name

    expect(page).to have_content("Add Review")
  end

  scenario 'going to station show page and seeing add review link' do
    station3 = FactoryGirl.create(:station)
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button "Log in"
    click_link station3.name
    click_link "Add Review"

    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
  end

  scenario 'going to station show page and adding a review and seeing it' do
    station3 = FactoryGirl.create(:station)
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button "Log in"
    click_link station3.name
    click_link "Add Review"
    fill_in 'Rating - Required', with: 4
    fill_in 'Review', with: "This review"
    click_button "Add Review"

    expect(page).to have_content("This review")
  end

end
