# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    name "Iphone 5"
    description "Some scratches"
    value 1
    image
    listing_category_id 1
    user_id 1

    categories
    users
  end
end
