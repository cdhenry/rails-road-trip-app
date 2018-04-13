module UserRoadTripsHelper
   def trip_completed(road_trip)
     trip = UserRoadTrip.where(road_trip_id: road_trip.id).where(user_id: current_user.id)
     if !trip.empty?
       !!trip.first.completed
     end
   end

   def urts_find_or_build(road_trip, user)
     urt = UserRoadTrip.where(road_trip_id: road_trip.id).where(user_id: user.id).first
     if !urt.nil?
       urt
     else
       UserRoadTrip.new(road_trip_id: road_trip.id, user_id: user.id)
     end
   end

   def road_trip_finder(road_trip_id)
     RoadTrip.find(road_trip_id)
   end
end
