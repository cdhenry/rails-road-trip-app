module RoadTripsHelper
  def find_trip(id)
    RoadTrip.find(id)
  end
end
