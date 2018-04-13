class AddCompletedToUserRoadTrips < ActiveRecord::Migration
  def change
    add_column :user_road_trips, :completed, :boolean, default: false
  end
end
