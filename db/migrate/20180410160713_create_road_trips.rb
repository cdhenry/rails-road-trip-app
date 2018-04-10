class CreateRoadTrips < ActiveRecord::Migration
  def change
    create_table :road_trips do |t|
      t.integer :author_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
