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

end