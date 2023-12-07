require 'rails_helper'

RSpec.describe Food, type: :model do

  before{@food = Food.new}

  describe 'Testes de preenchimento do model Food' do

    it 'name consegue ser preenchido?' do
      @food.name = 'macarronada'
      expect(@food.name).to eq('macarronada')
    end

    it 'description consegue ser preenchido?' do
      @food.description = 'massa saborosa com molho'
      expect(@food.description).to eq('massa saborosa com molho')
    end

  end

  describe 'Testes de validação do model Food' do

    it 'Food valido com campos obrigatorios preenchidos?' do
      @food.name = 'pizza'
      @food.description = 'massa saborosa coberta com molho e recheio'
      expect(@food).to be_valid
    end

    it 'Food invalido com campos obrigatorios não preenchidos?' do
      food = Food.new
      expect(food).to be_valid
    end

  end

end