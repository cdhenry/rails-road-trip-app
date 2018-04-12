class RoadTrip < ActiveRecord::Base
  has_many :user_road_trips
  has_many :users, through: :user_road_trips
  has_many :destination_road_trips
  has_many :destinations, through: :destination_road_trips
  has_many :tags, through: :destinations
  has_many :pictures, as: :imageable
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :destinations
  accepts_nested_attributes_for :destination_road_trips

  def total_destinations
    self.destinations.size
  end

  def destinations_attributes=(destination_attributes)
    destination_attributes.values.each do |destination_attribute|
      destination = Destination.find_or_initialize_by(destination_attribute)
      self.destinations << destination
    end
  end
end
