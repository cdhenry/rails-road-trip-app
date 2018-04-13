module DestinationRoadTripsHelper
  def drts_find_or_build(road_trip, destination)
    drt = DestinationRoadTrip.where(road_trip_id: road_trip.id).where(destination_id: destination.id).first
    if !drt.nil?
      drt
    else
      DestinationRoadTrip.new(road_trip_id: road_trip.id, destination_id: destination.id)
    end
  end
end
