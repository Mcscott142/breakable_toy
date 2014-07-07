class Category < ActiveRecord::Base
  has_many :listings
  belongs_to :in_return_category
end
