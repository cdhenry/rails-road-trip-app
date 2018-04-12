class AddTotalMilesToRoadTrips < ActiveRecord::Migration
  def change
    add_column :road_trips, :total_miles, :integer
  end
end
