class StationsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show, :new, :create]

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
    @station.user = current_user
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
