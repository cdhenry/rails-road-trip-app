class Destination < ActiveRecord::Base
  has_many :destination_tags
  has_many :tags, through: :destination_tags
  has_many :destination_road_trips
  has_many :road_trips, through: :destination_road_trips
  has_many :users, through: :road_trips
  has_many :pictures, as: :imageable
  has_many :comments, as: :commentable

  def city_state
    "#{self.city}, #{self.state}"
  end

  def top_tag
    self.tags[0]
  end
end
