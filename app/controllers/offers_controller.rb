class OffersController < ApplicationController
  def index
    @offers = Offer.where("user" == current_user)
  end

  def new
    @offer = Offer.new
    @listing = Listing.find(params[:listing_id])
    @listings = current_user.listings
  end

  def create
    @offer = current_user.offers.build(offer_params)
    @listing = Listing.find(params[:listing_id])
    @offer.listing = @listing
    @listings = current_user.listings

    if @offer.save
      flash[:notice] = "Offer made!"
      redirect_to listing_path(params[:listing_id])
    else
      flash[:notice] = "Fill out required fields"
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @listing = @offer.listing

    if @offer.update(offer_params)
      flash[:notice] = "Offer Updated"
      redirect_to @listing
    else
      flash[:notice] = "Unable to update"
      render :new
    end
  end

  def show
    @comment = Comment.new
    @offer = Offer.find(params[:id])
  end

  def accept_offer
    @offer = Offer.find(params[:id])
    @listing = @offer.listing
    @offer.status = "Accepted"
    @listing.status = "Closed"

    if @offer.save && @listing.save
      flash[:notice] = "Offer Accepted!"
      offers = @listing.offers
      offers.each do |offer|
        offer.reject_offer unless offer == @offer
      end
    else
      flash[:notice] = "Unable to update"
    end
    redirect_to @listing
  end

  def reject_offer
    @offer = Offer.find(params[:id])
    @listing = @offer.listing
    @offer.status = "Rejected"
    if @offer.save
      flash[:notice] = "Offer Rejected"
    else
      flash[:notice] = "Unable to update"
    end
    redirect_to @listing
  end

  private

  def offer_params
    params.require(:offer).permit(:user_id, :title, :description,
     :swap_listing_id, :status)
  end
end
