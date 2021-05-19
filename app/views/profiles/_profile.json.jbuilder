json.extract! profile, :id, :user_id, :name, :birthday, :background_color, :created_at, :updated_at
json.url profile_url(profile, format: :json)
