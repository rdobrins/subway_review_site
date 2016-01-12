class ReviewsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :authorize_user, only: [:destroy]

  def index
  end

  def new
    @user = current_user
    @station = Station.find(params[:station_id])
    @review = Review.new
  end

  def create
    @user = current_user
    @station = Station.find(params[:station_id])
    @review = Review.new(review_params)
    @review.station = @station

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to station_path(@station)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    @station = Station.find(params[:station_id])
    Review.find(params[:id]).destroy
    redirect_to station_path(@station)
  end

  def update
    @user = current_user
    @review = Review.find(params[:id])
    @station = Station.find(params[:station_id])
    vote = Vote.new(user: @user, review: @review)
    if params[:up] == "true"
      vote.up = true
    end
    if vote.save
      if params[:up] == "true"
        @review.up_votes += 1
      else
        @review.down_votes += 1
      end
    else
      temp = Vote.where(user: @user, review: @review).first
      Vote.where(user: @user, review: @review).first.destroy
      if temp.up == true
        @review.up_votes -= 1
        if params[:up] != "true"
          @review.down_votes += 1
          vote.save
        end
      else
        @review.down_votes -= 1
        if params[:up] == "true"
          @review.up_votes += 1
          vote.save
        end
      end
    end

    @review.save
    respond_to do |format|
      format.html { redirect_to station_path(@station) }
      format.js { render json: @review }
    end
  end
  private

  def review_params
    params.require(:review).permit(:rating, :body, :station_id, :user_id)
  end
end
