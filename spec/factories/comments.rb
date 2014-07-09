# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id 1
    offer_id 1
    description "Comment text 123456"
    user
    offer
  end
end
