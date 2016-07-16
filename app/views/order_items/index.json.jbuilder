json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :catalog_item_id, :order_id, :quantity, :unit_price, :total_price
  json.url order_item_url(order_item, format: :json)
end
