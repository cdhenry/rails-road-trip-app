# class DestinationOrderValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value <= RoadTrip.find(record.road_trip_id).destinations.count && value >= 0
#       record.errors[attribute] << (options[:message] || "Order number must be less than or equal to the number of destinations and more than 0")
#     end
#   end
# end

class DestinationRoadTrip < ActiveRecord::Base
  validates :destination_id, presence: true
  validates :road_trip_id, presence: true
  validates :destination_id, uniqueness: { scope: :road_trip_id,
    message: "Cannot list the same destination twice" }
  # validates :destination_order, presence: true, destination_order: true

  belongs_to :destination
  belongs_to :road_trip

  accepts_nested_attributes_for :destination
end
