json.array!(@units) do |unit|
  json.extract! unit, :id, :title
end
