require 'rails_helper'

feature 'user views a list of their own offers on various listings', %Q{
  As a user I want to view a list of all of my offers.
} do

  # As a user I want to view a list of my offers.
  # I want to see all of the offer details and what
  # listing the offer is related to.
  # I want to see the status of my offer.

  scenario "user views list of own offers" do
    user = FactoryGirl.create(:user, id: 10)
    sign_in_test_user(user)
    listing = FactoryGirl.create(:listing, id: 5)
    listing2 = FactoryGirl.create(:listing, id: 6)
    offer1 = FactoryGirl.create(:offer, title: "one", user_id: 10, swap_listing_id: 5)
    offer2 = FactoryGirl.create(:offer, title: "two", user_id: 10, swap_listing_id: 6)

    visit offers_path

    expect(page).to have_content "one"
    expect(page).to have_content "two"
  end
end
