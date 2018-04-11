class RoadTripsController < ApplicationController
  before_action :set_road_trip, only: [:show, :edit, :update, :destroy]

  def index
    @road_trips = RoadTrip.all
  end

  def show
  end

  def new
    @road_trip = RoadTrip.new
  end

  def edit
  end

  def create
    @road_trip = RoadTrip.new(road_trip_params)

    respond_to do |format|
      if @road_trip.save
        format.html { redirect_to @road_trip, notice: 'Road Trip was successfully created.' }
        format.json { render :show, status: :created, location: @road_trip }
      else
        format.html { render :new }
        format.json { render json: @road_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @road_trip.update(road_trip_params)
        format.html { redirect_to @road_trip, notice: 'Road Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @road_trip }
      else
        format.html { render :edit }
        format.json { render json: @road_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @road_trip.destroy
    respond_to do |format|
      format.html { redirect_to road_trips_url, notice: 'Road Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_road_trip
      @road_trip = RoadTrip.find(params[:id])
    end

    def road_trip_params
      params.require(:road_trip).permit(:title, :description)
    end
end
