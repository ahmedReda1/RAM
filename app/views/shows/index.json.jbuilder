json.array!(@shows) do |show|
  json.extract! show, :id, :user_id
  json.url show_url(show, format: :json)
end
