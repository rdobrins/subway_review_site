require "rails_helper"
# As a user
# I want to upvote a review
# So people can see awesomer reviews

# [ ] As a user I want to be able to upvote a review

feature 'station show page has upvote/downvote buttons for reviews' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @station = FactoryGirl.create(:station)
    @review = FactoryGirl.create(:review, user: @user, station: @station)
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
    click_link @station.name
  end
  scenario 'user upvotes a review' do
    page.find_by_id("review-#{@review.id}").find_button("upvote").click
    expect(page).to have_content("Upvotes: 1")
  end

  scenario 'user downvotes a review' do
    page.find_by_id("review-#{@review.id}").find_button("downvote").click
    expect(page).to have_content("Downvotes: 1")
  end

  scenario 'user downvotes a post they currently have upvoted' do
    page.find_by_id("review-#{@review.id}").find_button("upvote").click
    page.find_by_id("review-#{@review.id}").find_button("downvote").click
    expect(page).to have_content("Downvotes: 1")
    expect(page).to have_content("Upvotes: 0")
  end

  scenario 'user upvotes a post they currently have downvoted' do
    page.find_by_id("review-#{@review.id}").find_button("downvote").click
    page.find_by_id("review-#{@review.id}").find_button("upvote").click
    expect(page).to have_content("Upvotes: 1")
    expect(page).to have_content("Downvotes: 0")
  end

  scenario 'un-upvotes an upvote' do
    page.find_by_id("review-#{@review.id}").find_button("upvote").click
    page.find_by_id("review-#{@review.id}").find_button("upvote").click
    expect(page).to have_content("Upvotes: 0")
  end

  scenario 'un-downvotes an downvote' do
    page.find_by_id("review-#{@review.id}").find_button("downvote").click
    page.find_by_id("review-#{@review.id}").find_button("downvote").click
    expect(page).to have_content("Downvotes: 0")
  end
end
