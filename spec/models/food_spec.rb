require 'rails_helper'

RSpec.describe Food, type: :model do

  before{@food = Food.new}

  describe 'Testes de preenchimento do model Food' do

    it 'name consegue ser preenchido?' do
      @food.name = ''
      expect(@food.name).to eq('macarronada')
    end

  end

end