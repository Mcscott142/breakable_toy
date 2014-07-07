class InReturnCategory < ActiveRecord::Base
  has_one :category
  has_one :listing
end
