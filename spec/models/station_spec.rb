require 'rails_helper'

RSpec.describe Station, type: :model do
  let(:station) { FactoryGirl.create(:station) }
  before(:each) do
    station
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
