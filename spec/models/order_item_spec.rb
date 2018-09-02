require 'rails_helper'

describe OrderItem do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:calculate_total).after(:create) }
  end
end
