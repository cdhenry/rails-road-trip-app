class Destination < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :street_address, presence: true
  validates :street_address, uniqueness: true

  has_many :destination_tags
  has_many :tags, through: :destination_tags
  has_many :destination_road_trips
  has_many :road_trips, through: :destination_road_trips
  has_many :users, through: :road_trips
  has_many :pictures, as: :imageable
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :tags

  def visited
    self.destination_road_trips.count
  end

  def city_state
    "#{self.city}, #{self.state}"
  end

  def top_tag
    self.tags[0]
  end

  def stop_order(road_trip)
    trip = self.destination_road_trips.where(road_trip_id: road_trip.id).first
    trip.destination_order ||= 0
  end

  def on_this_trip?(road_trip)
    !DestinationRoadTrip.where(road_trip_id: road_trip.id).where(destination_id: self.id).empty?
  end
end
