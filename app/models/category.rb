class Category < ActiveRecord::Base
  belongs_to :listing
  belongs_to :in_return_category
end
