require 'rails_helper'

feature 'user signs into account, signs out of account', %Q{
  As a user I want to sign into my account to create new
  listings a see what others have listed. I then want to
  sign out so the next person at this computer cannot
  see all of my information.
} do

  # As a user I must enter my email and password.
  # I see a message telling me I have signed in.
  # I can select sign out.
  #I see a message telling me I have signed out.

  scenario 'user signs in' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_on 'Sign In'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

    expect(page).to have_content user.first_name
    expect(page).to have_content 'Welcome! You have signed up Successfully.'
  end

  scenario 'user signs out' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    click_on "Sign Out"

    expect(page).to have_content "Signed out successfully"
  end

  scenario 'user logs in without credentials' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_on 'Sign In'
    click_on "Sign in"

    expect(page).to have_content "Invalid email or password."
    expect(page).to_not have_content user.first_name
  end
end


