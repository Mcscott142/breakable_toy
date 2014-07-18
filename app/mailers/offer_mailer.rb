class OfferMailer < ActionMailer::Base
  default from: "colin@swapnotshop.com"

  def offer_alert(user, listing)
    @user = user
    @listing = listing

    mail(to: user.email, subject: "Offer made on your Listing!")
  end
end
