json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :doc, :phone, :email, :sex, :birthdate
  json.url person_url(person, format: :json)
end
