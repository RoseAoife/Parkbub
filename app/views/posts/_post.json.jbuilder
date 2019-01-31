json.extract! post, :id, :title, :cost, :address, :body, :posted_by, :created_at, :updated_at
json.url post_url(post, format: :json)
