require 'rails_helper'

feature 'user creates an account', %Q{
  As a user I want to create and account to list items
  and trade for other users listings. I want a confirmation email
  after I sign in to let me know the sign up was successful.
} do

  # As a user I must enter my full name, email, password
  # I can optionally add a profile picture
  # I receive a confirmation email upon registration

  scenario 'user can successfully create an account' do
    ActionMailer::Base.deliveries = []

    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Schmoe"
    fill_in "Email", with: "test@test.com"
    fill_in "City", with: "Anytown"
    fill_in "State", with: "Alabama"
    fill_in "Zip", with: "36606"
    page.select "United States"
    fill_in "Password", match: :first, with: "1234abcd"
    fill_in "Password Confirmation", with: "1234abcd"
    click_on "Create Account"

    expect(page).to have_content "Welcome! You have signed up Successfully"
    expect(page).to have_content "Joe"
    expect(page).to have_content "Sign Out"

    expect(ActionMailer::Base.deliveries.size).to eql(1)

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Welcome Joe!')
    expect(last_email).to have_content("Hey Joe, time to start trading.")
    expect(last_email).to deliver_to('test@test.com')
  end

  scenario 'user does not enter required information' do
    visit root_path
    click_on "Sign Up"
    click_on "Create Account"

    expect(page).to_not have_content "Joe"
    expect(page).to_not have_content "Sign Out"
  end
end
