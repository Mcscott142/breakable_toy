class Listing < ActiveRecord::Base
  belongs_to :category
  has_many :in_return_categories
  belongs_to :user
  has_many :offers

  validates :name, presence: true
  validates :description, presence: true
  validates :value, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

   mount_uploader :image, ListingPicUploader

   def self.search(query)
  where("name like ?", "%#{query}%")
   end
end
