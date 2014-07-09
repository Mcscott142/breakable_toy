require 'rails_helper'

feature 'user updates an offer on a listing', %Q{
  As a user I want to change my offer on a
  listing to be more desireable.
} do

# As a user I want to update my offer
# I want the ability to change the title, description, item
# or photo.

  scenario "user updates offer" do
    user1 = FactoryGirl.create(:user)
    sign_in_test_user(user1)
    listing1 = FactoryGirl.create(:listing, name: "Item 1", id: 50)
    listing2 = FactoryGirl.create(:listing, name: "Playstation", id: 60, user_id: user1.id)
    offer = FactoryGirl.create(:offer, user_id: user1.id, listing_id: 50, swap_listing_id: 60)

    visit listings_path
    click_on "Item 1"
    click_on "Edit Offer"
    fill_in "Title", with: "PS3"
    click_on "Update Offer"

    expect(page).to have_content "PS3"
  end
end
