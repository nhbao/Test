require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '.association' do
    it { should have_many(:order_items).dependent(:destroy) }
  end

  describe '.validations' do
    let!(:product) { create(:product) }
    
    describe 'name' do
      it 'must be present' do
        expect(product).to validate_presence_of(:name)
      end
    end
  end
end
