require 'rails_helper'

feature 'search bar' do

  before(:each) do
    FactoryGirl.create(:station)
    visit root_path
  end

  scenario 'user inputs and submits a search query' do
    FactoryGirl.create(:station, name: "Jupiterstation")
    FactoryGirl.create(:station, name: "Eye of Jupiter")
    FactoryGirl.create(:station, name: "Jupiter 4")

    fill_in "search", with: "Jupiter"
    click_on "Search"

    expect(page).to have_content("Jupiterstation")
    expect(page).to have_content("Eye of Jupiter")
    expect(page).to have_content("Jupiter 4")
    expect(page).to_not have_content("Chinatown")
  end

  scenario 'user inputs and submits a search query with no matches' do
    find(:css, "input[id$='search']").set("Saturn")
    click_on "Search"

    expect(page).to_not have_content("Saturn")
    expect(page).to have_content("Chinatown")
    expect(page).to have_content("No matching stations found")
  end
end
