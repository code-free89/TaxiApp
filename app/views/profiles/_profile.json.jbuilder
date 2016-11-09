json.extract! profile, :id, :lname, :fname, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)