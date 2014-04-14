json.array!(@trips) do |trip|
  json.extract! trip, :id, :starts_on
  json.url trip_url(trip, format: :json)
end
