require 'rails_helper'

feature 'user enters an offer on a listing', %Q{
  As a user I want to enter an offer on a listing
  that I want to trade for.
} do

  # As a user I want to enter an offer on a listing
  # I enter a title, description and the listing I want
  # to swap.

  scenario "user enters an offer on a listing" do
    user1 = FactoryGirl.create(:user)
    sign_in_test_user(user1)
    listing1 = FactoryGirl.create(:listing, name: "Item 1")
    listing2 = FactoryGirl.create(:listing, name: "Playstation", id: 2, user_id: user1.id)

    visit listings_path
    click_on "Item 1"
    click_on "Make an Offer"
    fill_in "Title", with: "PS3 negotiable"
    fill_in "Description", with: "Do you accept Paypal?"
    select "Playstation", from: "My Listings"
    click_on "Create Offer"

    expect(page).to have_content "Offer made!"
    expect(page).to have_content "PS3 negotiable"
    expect(page).to have_content "Do you accept Paypal?"
    expect(page).to have_content "Playstation"
  end

  scenario "User does not enter required information" do
    user1 = FactoryGirl.create(:user)
    sign_in_test_user(user1)
    listing1 = FactoryGirl.create(:listing)

    visit listing_path(listing1)
    click_on "Make an Offer"
    click_on "Create Offer"

    expect(page).to have_content "Fill out required fields"
    expect(page).to_not have_content "Offer made!"
  end
end
