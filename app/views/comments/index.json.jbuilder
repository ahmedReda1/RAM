json.array!(@comments) do |comment|
  json.extract! comment, :id, :meeting_id, :user_id, :commentbody
  json.url comment_url(comment, format: :json)
end
