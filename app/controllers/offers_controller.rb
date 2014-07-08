class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @listing = Listing.find(params[:listing_id])
    @listings = current_user.listings
  end

  def create
    @offer = current_user.offers.build(offer_params)
    @listing = Listing.find(params[:listing_id])
    @listings = current_user.listings

    if @offer.save
      flash[:notice] = "Offer made!"
      redirect_to listing_path(params[:listing_id])
    else
      flash[:notice] = "Fill out required fields"
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:user_id, :title, :description,
     :swap_listing_id, :status).merge( listing_id: params[:listing_id] )
  end
end
