require 'spec_helper'
# Home page display tests and additions

# [X] As a user I want to be able view a list of stations and add to it

feature 'view home page with list and adding to it' do

  scenario 'going to the root directory displays a stations list' do
    visit root_path
    expect(page).to have_content("Stations:")
  end

  scenario 'adding station to the station list' do
    visit root_path
    click_link 'Add New Station'
    fill_in 'Name', with: 'Main Station'
    fill_in 'Address', with: '123 Main Street'
    fill_in 'City', with: 'New York'
    fill_in 'State', with: 'NY', match: :prefer_exact
    fill_in 'Zip', with: '01234'
    click_on 'Add Station'

    expect(page).to have_content("Main Station")
  end

end
