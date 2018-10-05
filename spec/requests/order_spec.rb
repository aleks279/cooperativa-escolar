require 'rails_helper'

describe 'Order requests', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /orders' do
    it 'gets all the orders' do
      get orders_path
      expect(response).to be_successful
    end
  end

  describe 'GET /orders/:order_id' do
    let(:product) { create(:product) }
    let(:order) {
      create(:order, seller_id: user.id, order_items: [create(:order_item, product: product, amount: 3)])
    }

    it 'gets the correct order' do
      get order_path(order)
      expect(assigns[:order]).to eq(order)
    end
  end

  describe 'GET /orders/new' do
    it 'renders the new order template' do
      get new_order_path
      expect(response).to be_successful
    end

    it 'initializes the new order' do
      get new_order_path
      expect(assigns[:order]).to be_a_new(Order)
    end
  end

  describe 'POST /orders' do
    context 'with valid attributes' do
      it 'creates the new order' do
        post orders_path, params: {
          order: attributes_for(:order,
                                order_items_attributes: [attributes_for(:order_item)]),
        }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT /orders/:order_id' do
    context 'with valid attributes' do
      let(:product) { create(:product) }
      let(:order) {
        create(:order, seller_id: user.id, order_items: [create(:order_item, product: product, amount: 3)])
      }
      let(:first_item) { order.order_items.first }
      let(:params) {
        {
          order: {
            order_items_attributes: [
              {
                id: first_item.id,
                amount: 6,
                product_id: first_item.product.id,
              },
            ],
          },
        }
      }

      it 'updates the order' do
        put order_path(order), params: params
        expect(first_item.reload).to have_attributes(params[:order][:order_items_attributes].first)
      end
    end
  end

end
