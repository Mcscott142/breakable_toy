require 'rails_helper'

feature 'user comments on an offer', %Q{
  As a user I want to comment on an offer
  to begin a dialouge between listing user
  and offer user.
} do

# I want to enter a comment on an offer.
# I can enter the description of the comment and
# attach it to an offer.

  scenario "user comments on an offer" do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)
    listing = FactoryGirl.create(:listing, name: "Boat")
    offer = FactoryGirl.create(:offer)

    visit listings_path
    click_on "Boat"
    fill_in "Comment", with: "This is my offer"
    click_on "Post Comment"

    expect(page).to have_content "This is my offer"
  end

  scenario "user does not fill in required comment fields" do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)
    listing = FactoryGirl.create(:listing, name: "Boat")
    offer = FactoryGirl.create(:offer)

    visit listings_path
    click_on "Boat"
    click_on "Post Comment"

    expect(page).to have_content "Fill out required fields"
  end
end
