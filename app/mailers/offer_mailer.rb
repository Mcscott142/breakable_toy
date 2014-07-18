class OfferMailer < ActionMailer::Base
  default from: "colin@swapnotshop.com"

  def offer_alert(user)
    @user = user
    mail(to: user.email, subject: "Offer made on your Listing!")
  end
end
