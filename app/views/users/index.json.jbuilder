json.array!(@users) do |user|
  json.extract! user, :id, :person_id, :email
  json.url user_url(user, format: :json)
end
