class RoadTripsController < ApplicationController
  before_action :set_road_trip, only: [:show, :edit, :update, :destroy]
  #before_action :set_destinations, only: [:new, :edit, :update]

  def index
    @road_trips = RoadTrip.all
  end

  def show
  end

  def new
    @road_trip = RoadTrip.new
    @destinations = Destination.all
  end

  def edit
    @destinations = Destination.all
  end

  def create
    @road_trip = RoadTrip.new(road_trip_params)

    if @road_trip.save
      redirect_to @road_trip
    else
      render :new
    end
  end

  def update
    @destinations = Destination.all
    if @road_trip.update(road_trip_params)
      redirect_to @road_trip
    else
      render :edit
    end
  end

  def destroy
    @road_trip.destroy
    redirect_to road_trips_url
  end

  private
    def set_road_trip
      @road_trip = RoadTrip.find(params[:id])
    end

    # def set_destinations
    #   @destinations = Destination.all
    # end

    def road_trip_params
      params.require(:road_trip).permit(
        :title, :description, :total_miles,
        destination_ids:[], destinations_attributes: [:name, :description, :city, :state, :street_address],
        destination_road_trips_attributes:[:destination_id, :destination_order, :_destroy]
        )
    end
end
