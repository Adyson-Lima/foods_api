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

  describe 'GET /api/v1/foods/id' do
    it 'Consegue listar um food especifico e retornar status 200?' do
      get :show, params: {id: @food.id}
      expect(response.body).to include_json(id: @food.id)
      expect(response).to have_http_status(200)
    end    
  end

  describe 'POST /api/v1/foods' do
    it 'Consegue criar um food e retornar status 201?' do
      post :create, params: {food: {name: 'lasanha', description: 'prato de massa intercalada em camadas'},format: :json}
      expect(response.body).to include_json(name: 'lasanha')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/foods/id' do
    it 'Consegue atualizar um food e retornar status 200?' do
      food = Food.last
      patch :update, params: {food: {name: 'capeletti', description: 'massa fechada recheada cozida'}, id: food.id}
      expect(response.body).to include_json(name: 'capeletti')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/foods/id' do
    it 'Consegue excluir um food e retornar status 204?' do
      food = Food.last
      delete :destroy, params: {id: food.id}
      expect(Food.all).not_to include(food)
      expect(response).to have_http_status(204)
    end
  end
 
end