require 'spec_helper'

feature 'admin role' do
  let(:user_admin) { FactoryGirl.create(:user, role: "admin") }
  let(:user_member) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review) { FactoryGirl.create(:review, station_id: station.id) }
  before(:each) do
    visit root_path
    click_link 'Sign In'
  end

  scenario 'admin is able to delete stations and station reviews' do
    fill_in 'Email', with: user_admin.email
    fill_in 'Password', with: user_admin.password
    click_on 'Log in'
    click_link station.name
    @station_name = station.name
    @body = review.body

    click_on "Delete Review"

    expect(page).to_not have_content(@body)

    click_on "Delete Station"

    expect(page).to_not have_content(@station_name)
  end

  scenario 'non-admin is not able to delete stations or reviews' do
    fill_in 'Email', with: user_member.email
    fill_in 'Password', with: user_member.password
    click_on 'Log in'
    click_link station.name

    expect(page).to_not have_content("Delete Review")
    expect(page).to_not have_content("Delete Station")
  end
end
