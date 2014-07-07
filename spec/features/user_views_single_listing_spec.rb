require 'rails_helper'

feature 'user views a single listing', %Q{
  As a user I want to select a single listing to view
  its details and decide whether or not I want to
  swap for it.
} do

  # As a I user I navigate to a single items page
  # I want to see the name, description, photo(if any)
  # value, location, and user listing the item

  scenario "user views a listings details" do
    user1 = FactoryGirl.create(:user)
    sign_in_test_user(user1)
    listing = FactoryGirl.create(:listing)

    visit listings_path
    click_on listing.name

    expect(page).to have_content listing.name
    expect(page).to have_content listing.description
    expect(page).to have_content listing.value
    expect(page).to have_content listing.category.name
    expect(page).to have_content listing.user.first_name
    expect(page).to have_content listing.user.last_name
    expect(page).to have_content listing.user.city
    expect(page).to have_content listing.user.state
    expect(page).to have_content listing.user.zip
  end
end

