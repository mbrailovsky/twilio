class Order < ApplicationRecord

  has_many :order_items
  before_save :update_total

  def total
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def update_total
    self[:total] = total
  end

end
