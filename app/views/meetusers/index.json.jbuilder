json.array!(@meetusers) do |meetuser|
  json.extract! meetuser, :id, :meeting_id, :user_id
  json.url meetuser_url(meetuser, format: :json)
end
