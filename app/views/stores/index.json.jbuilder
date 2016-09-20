json.array!(@stores) do |store|
  json.extract! store, :id, :name, :description, :address
  json.url store_url(store, format: :json)
end
