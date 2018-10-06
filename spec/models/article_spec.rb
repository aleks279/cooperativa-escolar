require 'rails_helper'

describe Article do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:sections) }
  end
end
