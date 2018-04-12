class DestinationRoadTrip < ActiveRecord::Base
  belongs_to :destination
  belongs_to :road_trip

  accepts_nested_attributes_for :destination
end
