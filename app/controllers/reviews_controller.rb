class ReviewsController < ApplicationController
  before_action :find_list

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:name, :rating, :comment)
  end
end
