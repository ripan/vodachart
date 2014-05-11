json.array!(@aliens) do |alien|
  json.extract! alien, :id, :name, :alien_category_id, :planet_id
  json.url alien_url(alien, format: :json)
end
