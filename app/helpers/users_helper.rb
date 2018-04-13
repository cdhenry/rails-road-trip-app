module UsersHelper
  def trips_created(user)
    RoadTrip.where(author_id: user.id)
  end
end
