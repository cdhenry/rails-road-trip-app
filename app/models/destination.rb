class Destination < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :street_address, presence: true

  has_many :destination_tags
  has_many :tags, through: :destination_tags
  has_many :destination_road_trips
  has_many :road_trips, through: :destination_road_trips
  has_many :users, through: :road_trips
  has_many :pictures, as: :imageable
  has_many :comments, as: :commentable

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
end
