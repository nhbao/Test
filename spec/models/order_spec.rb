require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '.association' do
    it { should have_many(:order_items) }
  end

  describe '.method' do
    let(:order) { create(:order) }
    let(:product_1) { create(:product, tax: 10) }
    let(:product_2) { create(:product, tax: 0) }
    let!(:order_item_1) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.5) }
    let!(:order_item_2) { create(:order_item, product: product_2, order: order, quantity: 1, price: 10.0) }
    
    describe 'sales_taxes' do
      it 'should return ' do
        expect(order.sales_taxes).to eq 0 
      end
    end

    describe 'total' do
      it 'should return ' do
        expect(order.total).to eq 0 
      end
    end
  end
end
