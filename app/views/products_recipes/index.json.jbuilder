json.array!(@products) do |product|
  json.extract! product, :id, :title, :required, :unit_id
  json.url product_url(product, format: :json)
end
