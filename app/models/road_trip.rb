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

  def total_miles
  end

  def total_destinations
    self.destinations.size
  end
end
