json.array!(@commentevents) do |commentevent|
  json.extract! commentevent, :id, :event_id, :user_id, :commentbody
  json.url commentevent_url(commentevent, format: :json)
end
