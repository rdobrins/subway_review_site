class StationsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show, :new, :create]

  def index
    @stations = Station.all
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

  def destroy
    Station.find(params[:id]).destroy
    redirect_to stations_path
  end

  private

  def station_params
    params.require(:station).permit(:name, :address, :city, :state, :zip)
  end
end
