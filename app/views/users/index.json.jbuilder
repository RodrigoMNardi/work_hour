json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :hour, :week, :string
  json.url user_url(user, format: :json)
end
