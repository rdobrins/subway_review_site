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
  it 'has an average_rating method' do
    station
    review1
    review2
    review3

    expect(station.average_rating).to eq(3.7)
  end
end
