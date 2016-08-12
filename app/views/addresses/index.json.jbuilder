json.array!(@addresses) do |address|
  json.extract! address, :id, :city, :direccion, :calle, :barrio
  json.url address_url(address, format: :json)
end
