class StationsController < ApplicationController
  def index
    @stations = Station.all
    @user = current_user
  end

  def show
    @station = Station.find(params[:id])
    @reviews = @station.reviews
    @user = current_user
  end

  def new
    @station = Station.new
    @user = current_user
  end

  def create
    @user = current_user
    @station = Station.new(station_params)

    if @station.save
      redirect_to station_path(@station)
    else
      render :new
    end
  end

  private

  def station_params
    params.require(:station).permit(:name, :address, :city, :state, :zip)
  end
end
