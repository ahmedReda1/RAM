json.array!(@eventusers) do |eventuser|
  json.extract! eventuser, :id, :event_id, :user_id
  json.url eventuser_url(eventuser, format: :json)
end
