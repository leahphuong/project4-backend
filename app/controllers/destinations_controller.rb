class DestinationsController < ApplicationController
  def index
    @destinations = Trip.find_by_id(params[:trip_id]).destinations.all
    render json: @destinations
  end

  def show
    @destination = Trip.find_by_id(params[:trip_id]).destinations.find(params[:id])
    render json: @destination
  end

  def create
    @destination = Trip.find_by_id(params[:trip_id]).destinations.build(destination_params)

    if @destination.save
      render json: @destination, status: :created
    else
      render json: @destination.errors, status: :unprocessable_entity
    end
  end

  def update
    @destination = Trip.find_by_id(params[:trip_id]).destinations.find(params[:id])
    if @destination.update(destination_params)
      head :no_content
    else
      render json: @destination.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @destination = Trip.find_by_id(params[:trip_id]).destinations.find(params[:id])
    @destination.destroy
    head :no_content
  end
  def set_destination
    @destination = current_user.trips.find_by_id(params[:trip_id]).destinations.find(params[:id])
  end
  def destination_params
    params.require(:destination).permit(:country, :city, :est_cost, :trip_length, :description)
  end
  private :set_destination, :destination_params
end
