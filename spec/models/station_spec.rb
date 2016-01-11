require 'rails_helper'

RSpec.describe Station, type: :model do
  let(:station) { FactoryGirl.create(:station) }
  let(:review1) { FactoryGirl.create(:review, rating: 5, station_id: station.id) }
  let(:review2) { FactoryGirl.create(:review, rating: 4, station_id: station.id) }
  let(:review3) { FactoryGirl.create(:review, rating: 2, station_id: station.id) }
  it 'has an average_rating method' do
    station
    review1
    review2
    review3

    expect(station.average_rating).to eq(3.7)
  end
end
