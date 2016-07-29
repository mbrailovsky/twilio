class OrderItem < ApplicationRecord
  belongs_to :catalog_item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :catalog_item_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      100.0
    end
  end

  def total_price
    unit_price * quantity
  end

  def catalog_item_present
    if catalog_item.nil?
      errors.add(:catalog_item, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
