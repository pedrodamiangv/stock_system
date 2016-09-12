json.array!(@settings) do |setting|
  json.extract! setting, :id, :name, :phone, :email, :ruc, :description, :historic, :logo
  json.url setting_url(setting, format: :json)
end
