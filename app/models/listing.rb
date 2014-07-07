class Listing < ActiveRecord::Base
  has_one :category
  has_many :in_return_categories
  belongs_to :user
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true
  validates :value, presence: true
  validates :listing_category_id, presence: true
  validates :user_id, presence: true
end
