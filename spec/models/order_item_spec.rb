require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it 'has a factory' do
    expect(build :order_item).to be_valid
  end
end
