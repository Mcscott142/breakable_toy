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
  end

  def show
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :value, :image,
      :listing_category_id, :user_id)
  end
end
