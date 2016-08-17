class Carts < ApplicationRecord
  has_many :order_items

  def total_price
    order_items.sum(&:unit_price)
  end

  def add_item(catalog_item)
    item = order_items.where('catalog_item_id = ?', catalog_item).first
    if item
      item.quantity += 1
    end
    save
  end
end
