FactoryGirl.define do
  factory :catalog_item do
    name {Faker::Commerce.product_name}
    description 'description'
  end
end
