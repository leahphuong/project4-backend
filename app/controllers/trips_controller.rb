class TripsController < ApplicationController
  def index
    @trips = current_user.trips.all
    render json: @trips
  end

  def show
    @trip = current_user.trips.find(params[:id])
    render json: @trip
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      render json: @trip, status: :created,
      location: @trip
    else
      render json: @trips.errors, status: :unprocessable_entity
    end
  end

  def update
    @trip = current_user.trips.find(params[:id])
    if @trip.update(trip_params)
      head :no_content
    else
      render json: @trips.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy
    head :no_content
  end

  def set_trip
    @trips = current_user.trips.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:region, :start_date, :end_date)
  end

  private :set_trip, :trip_params
end
