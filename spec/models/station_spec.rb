require 'rails_helper'

RSpec.describe Station, type: :model do
  let(:station) { FactoryGirl.create(:station) }
  let(:review1) do
    FactoryGirl.create(:review, rating: 5, station_id: station.id)
  end
  let(:review2) do
    FactoryGirl.create(:review, rating: 4, station_id: station.id)
  end
  let(:review3) do
    FactoryGirl.create(:review, rating: 2, station_id: station.id)
  end

  before(:each) do
    station
  end
  it 'has an average_rating method' do
    review1
    review2
    review3
    expect(station.average_rating).to eq(3.7)
  end
  it 'has a search class method' do
    10.times do
      FactoryGirl.create(:station)
    end
    FactoryGirl.create(:station, name: "Chinatown Station SearchTest")

    expect(Station.search("SearchTest").length).to eq(1)
    expect(Station.search("SearchTest")[0].name).to eq(
      "Chinatown Station SearchTest")
  end
  it 'has correct information' do
    expect(station).to be_valid
  end
  it 'has no name' do
    station.name = nil
    expect(station).to_not be_valid
  end
  it 'has no address' do
    station.address = nil
    expect(station).to_not be_valid
  end
  it 'has no city' do
    station.city = nil
    expect(station).to_not be_valid
  end
  it 'has no state' do
    station.state = nil
    expect(station).to_not be_valid
  end
  it 'has incorrect zipcode info' do
    station.zip = 47823047238174382
    expect(station).to_not be_valid
    station.zip = nil
    expect(station).to_not be_valid
    station.zip = 'pie'
    expect(station).to_not be_valid
  end
end
