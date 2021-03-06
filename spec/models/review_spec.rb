require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { FactoryGirl.create(:review) }
  before(:each) do
    review
  end
  it 'has correct information' do
    expect(review).to be_valid
  end
  it 'has no user_id' do
    review.user_id = nil
    expect(review).to_not be_valid
  end
  it 'has no station_id' do
    review.station_id = nil
    expect(review).to_not be_valid
  end
  it 'has incorrect type rating' do
    review.rating = "fish"
    expect(review).to_not be_valid
  end
  it 'has incorrect value rating' do
    review.rating = 6
    expect(review).to_not be_valid
  end
  it 'has a unique user_id scoped to station_id' do
    review.save
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review)
    review1.user_id = review.user_id
    review1.station_id = review.station_id
    expect(review1).to_not be_valid
    expect(review2).to be_valid
  end
end
