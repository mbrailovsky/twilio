FactoryGirl.define do
  factory :order do |f|
    total {Faker::Number.decimal(3,2)}
  end
end
