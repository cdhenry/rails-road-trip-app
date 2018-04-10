class CreateUserRoadTrips < ActiveRecord::Migration
  def change
    create_table :user_road_trips do |t|
      t.belongs_to :user
      t.belongs_to :road_trip
      t.datetime :date_completed

      t.timestamps null: false
    end
  end
end
