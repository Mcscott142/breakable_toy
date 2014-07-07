require 'rails_helper'

feature 'user removes listing', %Q{
  As a user I want to remove a listing
  when I change my mind and want to keep my
  item.
} do

  #As a user I want to remove my listing

  scenario "user removes listing" do
     user1 = FactoryGirl.create(:user)
     sign_in_test_user(user1)
     listing = FactoryGirl.create(:listing, name: "Delete Me", user_id: user1.id)

     visit listings_path
     click_on listing.name
     click_on "Remove Listing"

     expect(page).to_not have_content "Delete Me"
   end
 end
