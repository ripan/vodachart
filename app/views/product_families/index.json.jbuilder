json.array!(@product_families) do |product_family|
  json.extract! product_family, :id, :name
  json.url product_family_url(product_family, format: :json)
end
