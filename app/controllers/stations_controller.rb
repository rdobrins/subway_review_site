class StationsController < ApplicationController
  def index
    @stations = Station.page params[:page]
  end

  def show
    @station = Station.find(params[:id])
    @reviews = @station.reviews
  end

  def new
    @station = Station.new
  end

  def create
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
