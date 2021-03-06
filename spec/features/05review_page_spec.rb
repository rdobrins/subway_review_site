require 'spec_helper'
# able to add reviews to a specific stations

# [X] As a user I want to be able add a review to a station

feature 'view station page with review button and go to review page' do

  scenario 'going to station show page and adding a review and seeing it' do
    ActionMailer::Base.deliveries.clear
    user1 = FactoryGirl.create(:user)
    station3 = FactoryGirl.create(:station)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button "Log in"
    click_link station3.name
    click_link "Add Review"
    select(5, from: "Rating - Required")
    fill_in 'Review', with: "This review"
    click_button "Add Review"

    expect(page).to have_content("This review")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario 'going to station show page and adding a review and seeing it' do
    station = FactoryGirl.create(:station)
    FactoryGirl.create(:review, rating: 4, station_id: station.id)
    FactoryGirl.create(:review, rating: 2, station_id: station.id)
    FactoryGirl.create(:review, rating: 1, station_id: station.id)
    visit root_path
    click_link station.name

    expect(page).to have_content("Rating: 2.3")
  end

  scenario 'unauthenticated user adding review' do
    station4 = FactoryGirl.create(:station)
    expect { visit new_station_review_path(station4) }.to raise_error(
      ActionController::RoutingError)
  end

  scenario "user can't add a review if they have already added a review" do
    station = FactoryGirl.create(:station)
    user = FactoryGirl.create(:user)
    FactoryGirl.create(
      :review, rating: 4, station_id: station.id, user_id: user.id)
    visit root_path
    click_link "Sign In"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    click_link station.name

    expect(page).to_not have_content("Add Review")
    expect(page).to have_content("Edit Review")
  end
end
