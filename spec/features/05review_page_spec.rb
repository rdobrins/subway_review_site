require 'spec_helper'
# able to add reviews to a specific stations

# [X] As a user I want to be able add a review to a station

feature 'view station page with review button and go to review page' do

  scenario 'going to station show page and seeing add review link' do
    station2 = FactoryGirl.create(:station)
    visit root_path
    click_link station2.name

    expect(page).to have_content("Add Review")
  end

  scenario 'going to station show page and seeing add review link' do
    station3 = FactoryGirl.create(:station)
    visit root_path
    click_link station3.name
    click_link "Add Review"


    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
  end

end
