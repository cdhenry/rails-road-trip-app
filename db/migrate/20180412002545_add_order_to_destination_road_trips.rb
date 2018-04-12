class AddOrderToDestinationRoadTrips < ActiveRecord::Migration
  def change
    add_column :destination_road_trips, :destination_order, :integer
  end
end
