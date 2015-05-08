json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :title, :membername, :date, :limit, :desc, :location, :user_id
  json.url meeting_url(meeting, format: :json)
end
