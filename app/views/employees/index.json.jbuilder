json.array!(@employees) do |employee|
  json.extract! employee, :id, :person_id, :function, :contract_date, :attachment
  json.url employee_url(employee, format: :json)
end
