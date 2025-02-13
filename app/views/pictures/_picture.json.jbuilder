json.extract! picture, :id, :latitude, :longitude, :name, :file_path, :created_at, :updated_at
json.url picture_url(picture, format: :json)
