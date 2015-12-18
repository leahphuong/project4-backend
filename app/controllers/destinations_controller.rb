class DestinationsController < ApplicationController
  def index
    @destinations = current_user.destinations.all
    render json: @destinations
  end

  def show
    @destination = current_user.destinations.find(params[:id])
    render json: @destination
  end

  def create
    @destination = current_user.destinations.build(destination_params)
    if @destination.save
      render json: @destination, status: :created,
      location: @destination
    else
      render json: @destinations.errors, status: :unprocessable_entity
    end
  end

  def update
    @destination = current_user.destinations.find(params[:id])
    if @destination.update(destination_params)
      head :no_content
    else
      render json: @destinations.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @destination = current_user.destinations.find(params[:id])
    @destination.destroy
    head :no_content
  end

  def set_destination
    @destination = current_user.destinations.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:country, :trip_length, :est_cost, :start_date, :end_date, :description, :longitude, :latitude, :photo_url)
  end
  private :set_destination, :destination_params
end
