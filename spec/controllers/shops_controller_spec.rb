require 'rails_helper'

describe ShopsController, type: :controller do
  describe 'GET index' do
    it 'should return success' do
      get :index
      expect(response).to be_successful
    end
  end
end
