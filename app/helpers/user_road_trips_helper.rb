module UserRoadTripsHelper
   def trip_completed(road_trip)
     trip = UserRoadTrip.where(road_trip_id: road_trip.id).where(user_id: current_user.id)
     if !trip.empty?
       !!trip.first.date_completed
     end
   end
end
  
