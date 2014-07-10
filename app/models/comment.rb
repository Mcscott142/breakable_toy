class Comment < ActiveRecord::Base
  belongs_to :offer
  belongs_to :user

  validates :description, presence: true
end
