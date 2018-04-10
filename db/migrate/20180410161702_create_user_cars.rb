class CreateUserCars < ActiveRecord::Migration
  def change
    create_table :user_cars do |t|
      t.belongs_to :user
      t.belongs_to :car

      t.timestamps null: false
    end
  end
end
