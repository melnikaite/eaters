json.array!(@integrations) do |product|
  json.extract! product, :id, :provider
end
