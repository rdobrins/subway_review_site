require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:vote) { FactoryGirl.create(:vote) }
  before(:each) do
    vote
  end
  it 'has correct information' do
    expect(vote).to be_valid
  end
  it 'has no user_id' do
    vote.user_id = nil
    expect(vote).to_not be_valid
  end
  it 'has no review_id' do
    vote.review_id = nil
    expect(vote).to_not be_valid
  end
  it 'has no vote boolean' do
    vote.up = nil
    expect(vote).to_not be_valid
  end
  it 'has a unique user_id scoped to review_id' do
    vote.save
    vote1 = FactoryGirl.create(:vote)
    vote2 = FactoryGirl.create(:vote)
    vote1.user_id = vote.user_id
    vote1.review_id = vote.review_id
    expect(vote1).to_not be_valid
    expect(vote2).to be_valid
  end
end
