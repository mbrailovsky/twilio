class OrderItem < ApplicationRecord
  belongs_to :catalog_item
  belongs_to :carts

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
