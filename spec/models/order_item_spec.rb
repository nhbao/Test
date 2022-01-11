require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe '.association' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
    it { should belong_to(:order) }
  end

  describe '.validations' do
    let(:order) { create(:order) }
    let(:product) { create(:product, tax: 10) }
    let!(:order_item) { create(:order_item, product: product, order: order, quantity: 2, price: 10.5) }

    describe 'price' do
      it 'must be present' do
        expect(order_item).to validate_presence_of(:price)
      end
      
      it 'must be number' do
        expect(order_item).to validate_numericality_of(:price)
      end
    end
  end

  describe '.method' do
    let(:order) { create(:order) }
    let(:product) { create(:product, tax: 10) }
    let!(:order_item) { create(:order_item, product: product, order: order, quantity: 2, price: 10.5) }
    
    describe 'total 21.0' do
      it 'should return ' do
        expect(order_item.total).to eq 21.0
      end
    end
  end
end
