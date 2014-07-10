class CommentsController < ApplicationController
  def create
    @offer = Offer.find(params[:offer_id])
    @listing = @offer.listing
    @comment = Comment.new(comment_params)
    @comment.offer = @offer
    @comment.user = current_user


    if @comment.save
      redirect_to @listing
    else
      flash[:notice] = "Fill out Required Fields"
      redirect_to @listing
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
