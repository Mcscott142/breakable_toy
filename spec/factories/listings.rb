
FactoryGirl.define do
  factory :listing do
    sequence (:name) { |n| "Item #{n}"}
    description "Some scratches"
    value 50
    image "Image goes Here"
    category_id 1
    user_id 1

    category
    user
  end
end
