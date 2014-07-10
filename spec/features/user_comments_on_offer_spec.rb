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
    user = FactoryGirl.create(:user, id: 77)
    sign_in_test_user(user)
    listing = FactoryGirl.create(:listing, name: "Boat", id: 25)
    listing2 = FactoryGirl.create(:listing, id: 26)
    offer = FactoryGirl.create(:offer, user_id: 77, listing_id: 25, swap_listing_id: 26)

    visit listings_path
    click_on "Boat"
    fill_in "Comment", with: "This is my offer"
    click_on "Create Comment"

    expect(page).to have_content "This is my offer"
  end

  scenario "user does not fill in required comment fields" do
    user = FactoryGirl.create(:user, id: 77)
    sign_in_test_user(user)
    listing = FactoryGirl.create(:listing, name: "Boat", id: 25)
    listing2 = FactoryGirl.create(:listing, id: 26)
    offer = FactoryGirl.create(:offer, user_id: 77, listing_id: 25, swap_listing_id: 26)

    visit listings_path
    click_on "Boat"
    click_on "Create Comment"

    expect(page).to have_content "Fill out Required Fields"
  end
end
