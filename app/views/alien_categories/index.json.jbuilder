json.array!(@alien_categories) do |alien_category|
  json.extract! alien_category, :id, :name
  json.url alien_category_url(alien_category, format: :json)
end
