require 'spec_helper'

describe Order do
  skip 'has a factory' do
    Factory.create(:order).should_be_valid
  end
end
