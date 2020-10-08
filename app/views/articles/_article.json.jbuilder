json.extract! article, :id, :name, :title, :content, :created_at, :updated_at
json.url article_url(article, format: :json)
