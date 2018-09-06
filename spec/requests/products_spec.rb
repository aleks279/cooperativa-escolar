require 'spec_helper'

describe 'Product request', type: :request do 
	let(:product) {create(:product)}

	describe 'GET /products' do
    it 'gets all the products' do
      get products_path
      expect(response).to be_successful
    end
	
end