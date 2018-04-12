module DestinationRoadTripsHelper
  def destination_finder(fields_object)
    Destination.find(fields_object.object.destination_id)
  end
end
