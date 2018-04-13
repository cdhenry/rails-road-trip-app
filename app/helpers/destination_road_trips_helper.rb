module DestinationRoadTripsHelper
  def drts_destination_finder(drts)
    Destination.find(drts.destination_id)
  end
end
