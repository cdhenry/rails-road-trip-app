module RoadTripsHelper
  def find_trip(id)
    RoadTrip.find(id)
  end

  def trip_author(author_id)
    User.find(author_id)
  end
end
