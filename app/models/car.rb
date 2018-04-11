class Car < ActiveRecord::Base
  has_many :user_cars
  has_many :users, through: :user_cars
  has_many :pictures, as: :imageable

  def make_and_model
    "#{self.make} #{self.model}"
  end

end
