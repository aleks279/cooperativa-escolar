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
    it 'GET /reports.pdf with actual month' do
      date = Time.zone.now.strftime("%m/%Y")
      get reports_path(format: :pdf, date: date)
      expect(response).to be_successful
    end
  end

  describe 'Render pdf' do
    it 'render _pdf.html.haml in reports_path' do
      get reports_path
      expect(response).to render_template '_pdf'
    end
  end
end