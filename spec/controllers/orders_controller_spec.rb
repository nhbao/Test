require 'rails_helper'

describe OrdersController, type: :controller do
  let!(:order) { create(:order) }
  let!(:order_2) { create(:order) }
  let(:product_1) { create(:product, tax: 10) }
  let(:product_2) { create(:product, tax: 0) }
  let!(:order_item_1) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.5) }
  let!(:order_item_2) { create(:order_item, product: product_2, order: order, quantity: 1, price: 10.0) }
  let!(:order_item_3) { create(:order_item, product: product_2, order: order_2, quantity: 1, price: 10.0) }

  describe 'GET index' do

    it 'should return success' do
      get :index
      expect(assigns(:orders).size).to eq 2
    end
  end

  describe 'GET show' do
    let(:params) do
      {
        id: order.id
      }
    end

    it 'should return success' do
      get :show, params: params
      expect(assigns(:order_items)).to eq [order_item_1, order_item_2]
      expect(response).to be_successful
    end
  end

  describe 'GET new' do
  end

  describe 'DELETE destroy' do
    let(:params) do
      {
        id: order.id
      }
    end

    it 'should destroy success' do
      expect { delete :destroy, params: params }.to change { Order.count }.by(-1)
    end
  end
end
