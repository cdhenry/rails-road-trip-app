
[1mFrom:[0m /home/cdhenry/temporary/rails-road-trip-app/app/models/road_trip.rb @ line 36 RoadTrip#destination_road_trips_attributes=:

    [1;34m31[0m: [32mdef[0m [1;34mdestination_road_trips_attributes=[0m(destination_road_trips_attributes)
    [1;34m32[0m:   trips_to_update = destination_road_trips_attributes.values.select {|destination_road_trip_attribute| !destination_road_trip_attribute[[33m:id[0m].nil?}
    [1;34m33[0m:   trips_to_update.each [32mdo[0m |drt|
    [1;34m34[0m:     [32mif[0m drt[[33m:destination_order[0m].to_i >= [1;34m0[0m && drt[[33m:destination_order[0m].to_i <= trips_to_update.length
    [1;34m35[0m:       [32mif[0m destination_road_trip = [1;34;4mDestinationRoadTrip[0m.where([35mid[0m: drt[[33m:id[0m])
 => [1;34m36[0m:         binding.pry
    [1;34m37[0m:         destination_road_trip.update([35mdestination_order[0m: drt[[33m:destination_order[0m])
    [1;34m38[0m:       [32mend[0m
    [1;34m39[0m:     [32mend[0m
    [1;34m40[0m:   [32mend[0m
    [1;34m41[0m: 
    [1;34m42[0m:   [1;34m# destination_road_trips_attributes.values.each do |destination_road_trip_attribute|[0m
    [1;34m43[0m:   [1;34m#   binding.pry[0m
    [1;34m44[0m:   [1;34m#   destination_road_trip = DestinationRoadTrip.find_or_initialize_by(destination_road_trip_attribute[:id])[0m
    [1;34m45[0m:   [1;34m#[0m
    [1;34m46[0m:   [1;34m#   if destination_road_trip_attribute[:destination_order].to_i >= 0 && destination_road_trip_attribute[:destination_order].to_i <= destination_road_trips_attributes.length[0m
    [1;34m47[0m:   [1;34m#     destination_road_trip.destination_order = destination_road_trip_attribute[:destination_order].to_i[0m
    [1;34m48[0m:   [1;34m#   else[0m
    [1;34m49[0m:   [1;34m#     destination_road_trip.destination_order = nil[0m
    [1;34m50[0m:   [1;34m#   end[0m
    [1;34m51[0m:   [1;34m#   destination_road_trip.save[0m
    [1;34m52[0m:     [1;34m# binding.pry[0m
    [1;34m53[0m:     [1;34m# if destination_road_trip.save[0m
    [1;34m54[0m:     [1;34m#   self.destination_road_trips << destination_road_trip[0m
    [1;34m55[0m:     [1;34m# end[0m
    [1;34m56[0m:   [1;34m# end[0m
    [1;34m57[0m: [32mend[0m

