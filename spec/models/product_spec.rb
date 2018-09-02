require 'rails_helper'

describe Product do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:in_stock) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:order_items) }
  end
end
