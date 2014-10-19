json.array!(@products) do |product|
  json.extract! product, :id, :title, :rest, :required, :unit_id, :category_id
  json.url product_url(product, format: :json)
end
