json.array!(@catalog_items) do |catalog_item|
  json.extract! catalog_item, :id, :name, :description, :price
  json.url catalog_item_url(catalog_item, format: :json)
end
