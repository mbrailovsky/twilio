class Order < ApplicationRecord
  has_many :order_items

  def total
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

end
