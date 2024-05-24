class ReviewsController < ApplicationController
  before_action :set_list

  def create
    @review = @list.reviews.new(review_params)
    @review.save
    redirect_to @list
  end

  def destroy
    @review = @list.reviews.find(params[:id])
    @review.destroy
    redirect_to @list
  end

  def show
    @list = List.find(params[:id])
    @reviews = @list.reviews
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
