class CommentMailer < ActionMailer::Base
  default from: "colin@swapnotshop.com"

  def comment_alert(user)
    @user = user
    mail(to: user.email, subject: "You have a message")
  end
end
