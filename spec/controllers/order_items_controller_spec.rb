require 'rails_helper'

describe OrderItemsController, type: :controller do
  let!(:order) { create(:order) }
  let!(:product_1) { create(:product, tax: 10) }
  let!(:product_2) { create(:product, tax: 0) }

  describe 'GET new' do
    let!(:order_item_1) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.5) }
    let!(:order_item_2) { create(:order_item, product: product_2, order: order, quantity: 1, price: 10.0) }
    let(:params) do
      {
        order_id: order.id
      }
    end

    it 'should return success' do
      get :new, params: params
      expect(assigns(:products).size).to eq 2
      expect(response).to be_successful
    end
  end

  describe 'POST create' do
    let(:params) do
      {
        order_id: order.id,
        order_item: {
          product_id: product_1.id,
          quantity: 1,
          price: 10.5
        }
      }
    end
    it 'should return success' do
      post :create, params: params, xhr: true

      expect(response).to be_successful
    end
  end

  describe 'PUT update' do
    let!(:order_item_1) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.5) }
    let(:params) do
      {
        order_id: order.id,
        id: order_item_1.id,
        order_item: {
          quantity: 2
        }
      }
    end
    it 'should return success' do
      put :update, params: params, xhr: true

      expect(order_item_1.reload.quantity).to eq 2
      expect(response).to be_successful
    end
  end
  
  describe 'DELETE destroy' do
    let!(:order_item_1) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.5) }
    let!(:order_item_2) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.0) }
    let(:params) do
      {
        order_id: order.id,
        id: order_item_1.id
      }
    end
    it 'should destroy success' do
      expect { delete :destroy, params: params, xhr: true }.to change { OrderItem.count }.by(-1)
    end
  end
end
