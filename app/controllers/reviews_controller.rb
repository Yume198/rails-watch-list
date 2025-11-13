class ReviewsController < ApplicationController
  before_action :set_list

  def create
    @review = @list.reviews.build(review_params)
    if @review.save
      redirect_to list_path(@list), notice: "Added New Review"
    else
      @bookmark = Bookmark.new
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    review = @list.reviews.find(params[:id])
    review.destroy
    redirect_to list_path(@list), status: :see_other, notice: "Removed Review"
  end


  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
