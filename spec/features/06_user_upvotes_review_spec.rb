require 'spec_helper'
# As a user
# I want to upvote a review
# So people can see awesomer reviews

# [ ] As a user I want to be able to upvote a review

feature 'station show page has upvote/downvote buttons for reviews' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @station = FactoryGirl.create(:station)
    @review = FactoryGirl.create(:review)
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
    click_link @station.name
  end
  scenario 'user upvotes a review' do
    page.find("review-#{@review.id}").find("upvote_button").click_button
    expect(@review.up_votes).to eq(1)
  end

  scenario 'user downvotes a review' do
    page.find("review-#{@review.id}").find("downvote_button").click_button
    expect(@review.down_votes).to eq(1)
  end

  scenario 'user downvotes a post they currently have upvoted' do
    page.find("review-#{@review.id}").find("upvote_button").click_button
    page.find("review-#{@review.id}").find("downvote_button").click_button
    expect(@review.up_votes).to eq(0)
    expect(@review.down_votes).to eq(1)
  end

  scenario 'user upvotes a post they currently have downvoted' do
    page.find("review-#{@review.id}").find("downvote_button").click_button
    page.find("review-#{@review.id}").find("upvote_button").click_button
    expect(@review.up_votes).to eq(1)
    expect(@review.down_votes).to eq(0)
  end

  scenario 'un-upvotes an upvote' do
    page.find("review-#{@review.id}").find("upvote_button").click_button
    page.find("review-#{@review.id}").find("upvote_button").click_button
    expect(@review.up_votes).to eq(0)
  end

  scenario 'un-downvotes an downvote' do
    page.find("review-#{@review.id}").find("downvote_button").click_button
    page.find("review-#{@review.id}").find("downvote_button").click_button
    expect(review.down_votes).to eq(0)
  end
end
