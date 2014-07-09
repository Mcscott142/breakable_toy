require 'rails_helper'

feature 'user views a list of listings', %Q{
  As a user I want to see a list of listings so I can decide
  what I want to swap for.
} do

  # As a user I want to view a list of listing.
  # The listings will show name, user, category and location

  scenario 'user views index for listings' do
    20.times {FactoryGirl.create(:listing)}
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    visit listings_path
    expect(page).to have_content "Item 1"
    expect(page).to have_content "Item 2"
    expect(page).to have_content "Item "
    expect(page).to have_content "Electronics"
    expect(page).to have_content "Mobile, AL"
    expect(page).to have_content "John Smith"
  end
end
