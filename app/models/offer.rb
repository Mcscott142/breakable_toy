class Offer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :swap_listing, class_name: "Listing"
  belongs_to :user

  validates :title, presence: true
  validates :listing, presence: true
  validates :user, presence: true
end
