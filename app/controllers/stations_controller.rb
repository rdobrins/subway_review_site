class StationsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :station_authorize_user, except: [:index, :show, :new, :create]

  def index
    @stations = Station.all
    @user = current_user
    @stations = Station.page params[:page]

    if params[:search]
      @stations = Station.search(params[:search]).page params[:page]
      if @stations.empty?
        flash[:notice] = "No matching stations found"
        redirect_to stations_path
      end
    else
      @stations = Station.page params[:page]
    end
  end

  def show
    @review = Review.new
    @user = current_user
    @station = Station.find(params[:id])
    @reviews = @station.reviews.to_a
    @reviews.sort! do |a, b|
      if a.up_votes + a.down_votes == 0
        return -1
      elsif b.up_votes + b.down_votes == 0
        return 1
      end

      ((b.up_votes - b.down_votes)/(b.up_votes + b.down_votes)) <=> ((a.up_votes - a.down_votes)/(a.up_votes + a.down_votes))
    end

  end

  def new
    @station = Station.new
    @user = current_user
  end

  def create
    @user = current_user
    @station = Station.new(station_params)
    @station.user = current_user
    if @station.save
      redirect_to station_path(@station)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])

    if @station.update(station_params)
      flash[:notice] = "Station updated successfully"
      redirect_to station_path(@station)
    else
      flash[:errors] = @station.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    Station.find(params[:id]).destroy
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name, :address, :city, :state, :zip)
  end
end
