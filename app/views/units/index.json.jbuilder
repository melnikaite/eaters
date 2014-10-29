json.array!(@units) do |unit|
  json.value unit.id
  json.text unit.title
end
