require 'rails_helper'

describe Order do
  describe 'assoiations' do
    it { is_expected.to belong_to(:seller) }
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to have_many(:order_items) }
  end
end
