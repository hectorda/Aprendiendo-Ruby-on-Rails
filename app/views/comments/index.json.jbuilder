json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :articles_id, :body
  json.url comment_url(comment, format: :json)
end
