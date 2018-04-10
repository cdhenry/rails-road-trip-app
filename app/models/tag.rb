class Tag < ActiveRecord::Base
  has_many :destination_tags
  has_many :destinations, through: :destination_tags
end
