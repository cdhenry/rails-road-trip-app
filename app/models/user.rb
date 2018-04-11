class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :current_trip, class_name: 'RoadTrip', foreign_key: 'current_trip_id'
  belongs_to :current_car, class_name: 'Car', foreign_key: 'current_car_id'

  has_many :user_road_trips
  has_many :road_trips, through: :user_road_trips
  has_many :user_cars
  has_many :cars, through: :user_cars
  has_many :pictures, as: :imageable

  def garage
    @garage
  end

  def garage=(car)
    @garage = []
    @garage << car
  end

  def self.road_warriors
    all.order(miles_driven: :desc).limit(10)
  end
end
