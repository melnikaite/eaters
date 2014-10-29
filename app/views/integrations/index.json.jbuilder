json.array!(@integrations) do |product|
  json.extract! product, :id, :provider
  json.url product_url(product, format: :json)
end
