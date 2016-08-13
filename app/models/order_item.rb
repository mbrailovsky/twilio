class OrderItem < ApplicationRecord
  belongs_to :catalog_item
  belongs_to :order
  belongs_to :carts

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def unit_price
    if persisted?
      self[:unit_price]
    else
      errors.add(:unit_price, "is not valid or is not active.")
    end
  end
  
  def quantity
    :quantity
  end
  
  def catalog_item_id
    :catalog_item_id
  end

  def total_price
    unit_price * quantity
  end
end
