class RoadTrip < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :total_miles, presence: true
  validates :author_id, presence: true

  has_many :user_road_trips
  has_many :users, through: :user_road_trips
  has_many :destination_road_trips
  has_many :destinations, through: :destination_road_trips
  has_many :tags, through: :destinations
  has_many :pictures, as: :imageable
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :destinations
  accepts_nested_attributes_for :destination_road_trips
  accepts_nested_attributes_for :tags

  def total_destinations
    self.destinations.size
  end

  def destinations_attributes=(destination_attributes)
    destination_attributes.values.each do |destination_attribute|
      destination = Destination.find_or_initialize_by(destination_attribute)
      if destination.save
        self.destination_road_trips.create(destination_id: destination.id)
      end
    end
  end

  def destination_road_trips_attributes=(destination_road_trips_attributes)
    trips_to_update = destination_road_trips_attributes.values.select {|destination_road_trip_attribute| !destination_road_trip_attribute[:id].nil?}
    trips_to_update.each do |drt|
      if drt[:destination_order].to_i >= 0 && drt[:destination_order].to_i <= trips_to_update.length
        if !DestinationRoadTrip.where(id: drt[:id]).empty?
          DestinationRoadTrip.where(id: drt[:id]).first.update(destination_order: drt[:destination_order])
        end
      end
    end
  end
end
