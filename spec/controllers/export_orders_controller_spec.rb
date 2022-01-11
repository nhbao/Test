require 'rails_helper'

describe ExportOrdersController, type: :controller do
  let(:order) { create(:order) }
  let(:product_1) { create(:product, tax: 10) }
  let(:product_2) { create(:product, tax: 0) }
  let!(:order_item_1) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.5) }
  let!(:order_item_2) { create(:order_item, product: product_2, order: order, quantity: 1, price: 10.0) }
  let(:params) do
    {
      id: order.id
    }
  end

  describe 'GET index' do
    it 'should return success' do
      get :index, params: params, format: :csv
      expect(response).to be_successful
    end
  end
end
