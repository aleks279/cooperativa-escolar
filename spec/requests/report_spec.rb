require 'rails_helper'

describe 'Report requests', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /reports' do
    it 'gets month report' do
      get reports_path
      expect(response).to be_successful
    end
  end
end
