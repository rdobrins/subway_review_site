class ReviewsController < ApplicationController
  def index
  end

  def new
    @station = Station.find(params[:station_id])
    @review = Review.new
  end

  def create
    @station = Station.find(params[:station_id])
    @review = Review.new(review_params)
    @review.station = @station

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :station_id, :user_id)
  end
end
