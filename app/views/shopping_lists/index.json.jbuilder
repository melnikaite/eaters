json.array!(@shopping_lists) do |product|
  json.extract! product, :id, :title
  json.url product_url(product, format: :json)
end
