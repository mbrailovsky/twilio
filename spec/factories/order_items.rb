FactoryGirl.define do
  factory :order_item do
    quantity  {Faker::Number.number(1)}
    catalog_item
    order
  end
end
