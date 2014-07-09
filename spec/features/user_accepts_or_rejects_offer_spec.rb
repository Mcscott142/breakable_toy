require 'rails_helper'

feature 'user accepts or rejects an offer', %Q{
  As a user I want to either accept or reject
  the offers made on my listing.
} do

  # As a user I want to click on accept to accept an offer
  # As a user I want to see the status of the offer as accepted
  # As a user I want to click on reject to reject an offer
  # As a user I want to see the status of the offer as rejected

  scenario "user accepts an offer" do
    user1 = FactoryGirl.create(:user, id: 5)
    sign_in_test_user(user1)
    listing1 = FactoryGirl.create(:listing, name: "Test Item", user_id: 5, id: 5)
    listing2 = FactoryGirl.create(:listing, id: 10)
    offer = FactoryGirl.create(:offer, listing_id: 5, swap_listing_id: 10)

    visit listings_path
    click_on "Test Item"
    click_on "Accept Offer"

    expect(page).to have_content "Offer Accepted!"
  end


  scenario "user rejects an offer" do
    user1 = FactoryGirl.create(:user, id: 9)
    sign_in_test_user(user1)
    listing1 = FactoryGirl.create(:listing, name: "Test Item", user_id: 9, id: 5)
    listing2 = FactoryGirl.create(:listing, id: 10)
    offer = FactoryGirl.create(:offer, listing_id: 5, swap_listing_id: 10)

    visit listings_path
    click_on "Test Item"
    click_on "Reject Offer"

    expect(page).to have_content "Offer Rejected"
  end
end
