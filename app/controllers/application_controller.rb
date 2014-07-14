class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_filter :configure_permitted_parameters, if: :devise_controller?

   before_action :set_listings

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :city,
      :state, :zip, :country, :profile_pic]
  end

   def set_listings
    @recentlistings = Listing.order(created_at: :desc ).limit(5)
   end
end
