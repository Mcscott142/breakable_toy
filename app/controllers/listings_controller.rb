class ListingsController < ApplicationController
  def new
    @listing = Listing.new
    @categories = Category.all
  end

  def create
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      flash[:notice] = "Item listed!"
      redirect_to root_path
    else
      flash[:notice] = "Please Fill out required fields"
      render :new
    end
  end

  def index
    @listings = Listing.order(:name)
  end

  def show
    @listing = Listing.find(params[:id])
  end

   def edit
   @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params) && @listing.user_id == current_user.id
      flash[:notice] = "Listing Updated"
      redirect_to @listing
    else
      flash[:notice] = "Unable to submit update in this format."
      render :new
    end
  end

  def destroy
     @listing = Listing.find(params[:id])

    if @listing.destroy && @listing.user_id == current_user.id
      flash[:notice] = "Listing Removed"
      redirect_to listings_path
    else
      flash[:notice] = "Unable to Remove listing."
      render :new
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :value, :image,
      :category_id, :user_id)
  end
end
