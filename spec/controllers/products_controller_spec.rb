require 'rails_helper'

describe ProductsController, type: :controller do
  let!(:product_1) { create(:product, tax: 10) }
  let!(:product_2) { create(:product, tax: 0) } 
  
  describe 'GET index' do
    it 'should return success' do
      get :index
      expect(assigns(:products)).to eq [product_1, product_2]
    end
  end

  describe 'GET show' do
    let(:params) do
      {
        id: product_1.id
      }
    end

    it 'should return success' do
      get :show, params: params
      expect(response).to be_successful
    end
  end

  describe 'GET new' do
    it 'should return success' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET edit' do
  end

  describe 'POST create' do
    let(:params) do
      {
        product: {
          name: 'book',
          tax: 10
        }
      }
    end
    it 'should create success' do
      post :create, params: params

      expect(Product.last.name).to eq 'book'
    end
  end

  describe 'PUT update' do
    let(:params) do
      {
        id: product_1.id,
        product: {
          name: 'cake',
          tax: 0
        }
      }
    end
    it 'should update success' do
      put :update, params: params
      expect(product_1.reload.name).to eq 'cake'
    end
  end

  describe 'DELETE destroy' do
    let(:params) do
      {
        id: product_1.id
      }
    end

    it 'should destroy success' do
      expect { delete :destroy, params: params }.to change { Product.count }.by(-1)
    end
  end
end
