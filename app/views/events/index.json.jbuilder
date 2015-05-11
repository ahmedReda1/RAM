json.array!(@events) do |event|
  json.extract! event, :id, :title, :desc, :date, :place, :member, :meeting_id
  json.url event_url(event, format: :json)
end
