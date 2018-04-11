json.array!(@destinations) do |destination|
  json.extract! destination, :id, :name, :description, :city, :state, :street_address
  json.url destination_url(destination, format: :json)
end
