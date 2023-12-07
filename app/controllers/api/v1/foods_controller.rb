class Api::V1::FoodsController < ApplicationController

  before_action :set_food, only: %i[show update destroy] # show update destroy

  def index
    @foods = Food.all 
    render json: @foods
  end

  def show
    render json: @food
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      render json: @food, status: :created, location: api_v1_food_url(@food)
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!
  end


private

def set_food
  @food = Food.find(params[:id])
end

def food_params
  params.require(:food).permit(:name, :description)
end

end