class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :miles_driven, default: 0
      t.integer :current_trip_id
      t.integer :current_car_id
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
