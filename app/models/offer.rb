class Offer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :swap_listing, class_name: "Listing"
  belongs_to :user

  has_many :comments

  validates :title, presence: true
  validates :listing, presence: true
  validates :user, presence: true

  # def accept_offer
  #   self.status = 'accepted'
  #   self.save
  # end

  def reject_offer
    self.status = 'Rejected'
    self.save
  end
end
