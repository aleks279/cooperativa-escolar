require 'rails_helper'

describe 'Product requests', type: :request do
	describe 'GET /products/new' do
		it 'render the template for new product' do
			response = get new_product_path
			expect(response).to be_successful
		end
	end
end