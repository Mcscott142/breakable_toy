class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :listings
  has_many :offers
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 after_create :send_welcome_message

 mount_uploader :profile_pic, ProfilePicUploader

  def send_welcome_message
    WelcomeMailer.welcome(self).deliver
    return true
  end
end

