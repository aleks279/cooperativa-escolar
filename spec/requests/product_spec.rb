require 'rails_helper'

describe 'Product requests', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /products' do
    it 'gets all the products' do
      get products_path
      expect(response).to be_successful
    end
  end

  xdescribe 'GET /products/:product_id' do
    let(:product) { create(:product) }

    it 'gets the correct product' do
      get product_path(product)
      expect(assigns[:product]).to eq(product)
    end
  end

  describe 'GET /products/new' do
    it 'render the new product template' do
      get new_product_path
      expect(response).to be_successful
    end

    it 'initializes the new product' do
      get new_product_path
      expect(assigns[:product]).to be_a_new(Product)
    end
  end

  describe 'POST /products' do
    describe 'with valid attributes' do
      let(:valid_attributes) do
        { product: attributes_for(:product) }
      end

      it 'creates the new product' do
        expect {
          post products_path, params: valid_attributes
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the product view' do
        post products_path, params: valid_attributes
        expect(response).to redirect_to products_path
      end
    end

    describe 'with invalid attributes' do
      let(:invalid_attributes) do
        { product: attributes_for(:product, name: '', description: '') }
      end

      it 're-renders the new product template' do
        post products_path, params: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET /products/:product_id/edit' do
    let(:product) { create(:product) }
  
    it 'renders the edit product template' do
      get edit_product_path(product)
      expect(response).to be_successful
    end

    it 'initializes the product' do
      get edit_product_path(product)
      expect(assigns[:product]).to eq(product)
    end
  end

  describe 'PUT /products/:product_id' do
    let(:existing_product) { create(:product) }

    describe 'with valid attributes' do
      let(:params) {
        {
          product: {
            name: 'new name',
            description: 'new description'
          }
        }
      }

      it 'updates the product' do
        put product_path(existing_product), params: params
        expect(existing_product.reload).to have_attributes(params[:product])
      end

      it 'redirects to the product page' do
        put product_path(existing_product), params: params
        expect(response).to redirect_to products_path
      end
    end

    describe 'with invalid attributes' do
      let(:invalid_params) {
        {
          product: {
            name: '',
            description: ''
          }
        }
      }

      it 're-renders the edit product template' do
        put product_path(existing_product), params: invalid_params
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE /products/:product_id' do
    let!(:deletable_product) { create(:product) }

    it 'succeeds' do
      expect {
        delete product_path(deletable_product)
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to the product index page' do
      delete product_path(deletable_product)
      expect(response).to redirect_to products_path
    end
  end
end
