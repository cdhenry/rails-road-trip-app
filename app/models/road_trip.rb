require 'open-uri'
require 'nokogiri'

class RoadTrip < ActiveRecord::Base
  has_many :user_road_trips
  has_many :users, through: :user_road_trips
  has_many :destination_road_trips
  has_many :destinations, through: :destination_road_trips
  has_many :tags, through: :destinations
  has_many :pictures, as: :imageable
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :destinations

  def total_miles
  end

  def total_destinations
    self.destinations.size
  end

  def destinations_attributes=(destination_attributes)
    destination_attributes.values.each do |destination_attribute|
      destination = Destination.find_or_create_by(destination_attribute)
      self.destinations << destination
    end
  end
end
