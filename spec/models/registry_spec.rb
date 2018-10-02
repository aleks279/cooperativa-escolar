require 'rails_helper'

describe Registry do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:registry_type) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
