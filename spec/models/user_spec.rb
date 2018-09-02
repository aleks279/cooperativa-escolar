require 'rails_helper'

describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:id_number) }
    it { is_expected.to validate_uniqueness_of(:id_number) }
    it { is_expected.to validate_presence_of(:role) }
  end
end
