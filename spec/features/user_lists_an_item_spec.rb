require 'rails_helper'

feature 'user creates an item listing', %Q{
  As a user I want to list an item for trade
  so that people can view it and make offers
  on it.
} do

# As a user I must enter a listing name,
# price and category.
# I can optionally upload a photo of my item
# I can provide a list of categories that are
# acceptable for trading.

  scenario "user lists an item for trade" do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    click_on "Add Listing"
    fill_in "Name", with: "Iphone 4"
    fill_in "Description", with: "Like New"
    fill_in "Value", with: "120"
    select "Electronics", from: "Category"
    click_on "Create Listing"

    expect(page).to have_content "Item listed!"
    expect(page).to have_content "user.first_name"
  end

  scenario "user does not fill out required information" do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    click_on "Add Listing"
    click_on "Create Listing"

    expect(page).to have_content "Please Fill out required fields"
  end
end

