class WelcomeController < ApplicationController
  def index
    if user_signed_in?
     flash[:notice] = "Welcome! You have signed up Successfully."
   end
  end
end
