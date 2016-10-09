json.extract! announce, :id, :nom, :description, :prix, :created_at, :updated_at
json.url announce_url(announce, format: :json)