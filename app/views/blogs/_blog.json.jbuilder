json.extract! blog, :id, :title, :state, :content_url, :published_at, :created_at, :updated_at
json.url blog_url(blog, format: :json)
