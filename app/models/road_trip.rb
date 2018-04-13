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
  accepts_nested_attributes_for :destination_road_trips, allow_destroy: true
  #reject_if: lambda {|a| a[:destination_order].blank? || a[:destination_order].to_i < 0 || a[:destination_order].to_i > a.length},

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
    destination_road_trips_attributes.values.each do |destination_road_trip_attribute|
      destination_road_trip = DestinationRoadTrip.find_or_initialize_by(destination_road_trip_attribute[:destination_id])

      if destination_road_trip_attribute[:destination_order].to_i >= 0 && destination_road_trip_attribute[:destination_order].to_i <= destination_road_trips_attributes.length
        destination_road_trip.destination_order = destination_road_trip_attribute[:destination_order].to_i
      else
        destination_road_trip.destination_order = nil
      end
      destination_road_trip.save
      # binding.pry
      # if destination_road_trip.save
      #   self.destination_road_trips << destination_road_trip
      # end
    end
  end
end
