class WelcomeController < ApplicationController
  def index
    @listings = Listing.order(created_at: :desc ).limit(10)
  end
end
