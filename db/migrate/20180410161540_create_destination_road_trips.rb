class CreateDestinationRoadTrips < ActiveRecord::Migration
  def change
    create_table :destination_road_trips do |t|
      t.integer :road_trip_id
      t.integer :destination_id

      t.timestamps null: false
    end
  end
end
