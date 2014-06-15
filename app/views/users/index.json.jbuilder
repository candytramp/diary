json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :second_name, :male, :birthday
  json.url user_url(user, format: :json)
end
