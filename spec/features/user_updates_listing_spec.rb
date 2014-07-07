require 'rails_helper'

feature 'user updates listing', %Q{
  As a user I want to change my listing
  and have it reflect those changes when
  a user reviews it.
} do

  #As a user I want to update any field in my listing

  scenario "user updates listing" do
     user1 = FactoryGirl.create(:user)
     sign_in_test_user(user1)
     listing = FactoryGirl.create(:listing, user_id: user1.id)

     visit listings_path
     click_on listing.name
     click_on "Edit Listing"
     fill_in "Description", with: "Colin is the best"
     click_on "Update Listing"

     expect(page).to have_content "Colin is the best"
     expect(page).to_not have_content "Some scratches"
  end
end
