class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :miles_driven
      t.integer :current_trip_id
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
