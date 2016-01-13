require 'rails_helper'

feature 'user may edit and delete their own content' do
  let(:user) { FactoryGirl.create(:user) }
  let(:user_friend) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station, user_id: user.id) }
  let!(:review) do
    FactoryGirl.create(:review, station_id: station.id, user_id: user.id)
  end
  before(:each) do
    visit root_path
    click_link 'Sign In'
  end

  scenario 'user is able to delete stations and station reviews they created' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    click_link station.name
    @station_name = station.name
    @body = review.body

    click_on "Delete Review"

    expect(page).to_not have_content(@body)

    click_on "Delete Station"

    expect(page).to_not have_content(@station_name)
  end

  scenario 'user is not able to delete stations or reviews they did not make' do
    fill_in 'Email', with: user_friend.email
    fill_in 'Password', with: user_friend.password
    click_on 'Log in'
    click_link station.name

    expect(page).to_not have_content("Delete Review")
    expect(page).to_not have_content("Delete Station")
  end

  scenario 'user is able to edit stations and station reviews they created' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    click_link station.name

    click_on "Edit Review"
    select(1, from: "Rating - Required")
    fill_in 'Review', with: "Update This review"
    click_button "Update Review"

    expect(page).to have_content(station.name)
    expect(page).to have_content("Update This review")

    click_on "Edit Station"
    fill_in 'Name', with: 'Updated Station'
    click_on 'Update Station'

    expect(page).to have_content("Updated Station")
  end

  scenario 'user is not able to edit stations or reviews they did not make' do
    fill_in 'Email', with: user_friend.email
    fill_in 'Password', with: user_friend.password
    click_on 'Log in'
    click_link station.name

    expect(page).to_not have_content("Edit Review")
    expect(page).to_not have_content("Edit Station")
  end
end
