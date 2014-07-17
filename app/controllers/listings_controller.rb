class ListingsController < ApplicationController
  def new
    @listing = Listing.new
    @categories = Category.all
  end

  def mylistings
    @mylistings = Listing.where(:user_id == current_user.id)
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      params[:listing][:in_return_category_ids].each do |i|
        if i != ""
        category = Category.find(i)
        InReturnCategory.create(listing: @listing, category: category)
        end
      end
      flash[:notice] = "Item listed!"
      redirect_to listings_path
    else
      flash[:notice] = "Please Fill out required fields"
      render :new
    end
  end

  def index
    if params[:search]
      @listings = Listing.search(params[:search]).order("created_at DESC")
    elsif
      @listings = Listing.order(params[:sort])
    else
      @listings = Listing.order(created_at: :desc)
    end
  end

  def show
    @comment = Comment.new
    @listing = Listing.find(params[:id])


    if @listing.user == current_user
      @offers = @listing.offers
    else
      @offers = @listing.offers.where(user: current_user)
    end
  end

   def edit
   @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @categories = Category.all

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
