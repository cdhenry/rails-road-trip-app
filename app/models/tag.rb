class Tag < ActiveRecord::Base
  validates :title, presence: true

  has_many :destination_tags
  has_many :destinations, through: :destination_tags

  def popularity
    self.destinations.count
  end

  def last_destination
    if last_association = DestinationTag.where(tag_id: self.id).order(created_at: :desc).limit(1)[0]
      Destination.find(last_association.destination_id)
    end
  end
end
