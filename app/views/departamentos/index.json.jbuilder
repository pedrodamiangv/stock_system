json.array!(@departamentos) do |departamento|
  json.extract! departamento, :id, :departamento, :country_id
  json.url departamento_url(departamento, format: :json)
end
