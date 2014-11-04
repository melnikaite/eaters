json.array!(@shopping_lists) do |shopping_list|
  json.extract! shopping_list, :id, :title
end
