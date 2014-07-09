# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    user_id 1
    listing_id 1
    title "Xbox 360"
    description "Used"
    swap_listing_id 1
    status "Open"

    user
    listing
  end
end
