json.array!(@users) do |user|
  json.extract! user, :id, :provider, :uid, :name, :email, :oauth_token, :identity_id, :oauth_expires_at
  json.url user_url(user, format: :json)
end
