# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    sequence(:email, 100) { |n| "dude#{n}@example.com" }
    password "1234abcd"
    first_name "John"
    last_name "Smith"
    city "Mobile"
    state "AL"
    zip "36606"
    country "United States"
    end
end
