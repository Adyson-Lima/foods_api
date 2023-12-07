class Api::V1::FoodsController < ApplicationController

  before_action :set_food, only: %i[] # show update destroy

  def index
    @foods = Food.all 
    render json: @foods
  end

private

def set_food
  @food = Food.find(params[:id])
end

def food_params
  params.require(:food).permit(:name, :description)
end

end