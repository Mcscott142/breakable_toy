# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    name "MyString"
    description "MyString"
    value 1
    image "MyString"
    listing_category_id 1
    user_id 1
  end
end
