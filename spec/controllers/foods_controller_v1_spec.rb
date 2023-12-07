require 'rails_helper'

RSpec.describe Api::V1::FoodsController, type: :controller do

  before{@food = Food.create(name: 'Bolo de chocolate', description: 'muito gostoso')}

  describe 'GET /api/v1/foods' do
    it 'Consegue listar todos os foods e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end