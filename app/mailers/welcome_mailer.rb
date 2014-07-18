class WelcomeMailer < ActionMailer::Base
  default from: "colin@swapnotshop.com"

  def welcome(user)
    @user = user

    mail to: @user.email,
      subject: "Welcome #{@user.first_name}!"
  end
end
