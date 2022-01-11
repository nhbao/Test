require 'rails_helper'

describe ExportCsvService do
  context 'perform' do
    let(:order) { create(:order) }
    let(:product_1) { create(:product, tax: 10) }
    let(:product_2) { create(:product, tax: 0) }
    let!(:order_item_1) { create(:order_item, product: product_1, order: order, quantity: 1, price: 10.5) }
    let!(:order_item_2) { create(:order_item, product: product_2, order: order, quantity: 1, price: 10.0) }
    let(:attr) do
      [
        {
          quantity: 1,
          name: 'cake',
          price: 12
        },
        {
          quantity: 1,
          name: 'book',
          price: 20
        },
        {
          sales_taxes: 1.2,
          total: 32
        }
      ]
    end

    subject { ExportCsvService.new(attr, Order::CSV_ATTRIBUTES) }

    it 'should return success' do
      expect(subject.perform).to eq "Quantity,Product,Price\n1,cake,12\n1,book,20\nSales Taxes,Total\n1.2,32\n"
    end
  end
end

