class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def show
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to @destination
    else
      format.html { render :new }
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to @destination
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_url
  end

  private
    def set_destination
      @destination = Destination.find(params[:id])
    end

    def destination_params
      binding.pry
      params.require(:destination).permit(:name, :description, :city, :state, :street_address, tags_attributes: [:title])
    end
end
