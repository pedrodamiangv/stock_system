json.array!(@cities) do |city|
  json.extract! city, :id, :city, :country_id
  json.url city_url(city, format: :json)
end
