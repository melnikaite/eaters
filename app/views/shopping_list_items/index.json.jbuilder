json.array!(@shopping_list_items) do |shopping_list_item|
  json.extract! shopping_list_item, :id, :shopping_list_id, :product_id, :unit_id, :required, :done
  json.url shopping_lists_url(shopping_list_item.shopping_list_id, format: :json)
end
