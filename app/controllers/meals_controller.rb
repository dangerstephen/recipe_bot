class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

def index
  @meals = Meal.where(start: params[:start]..params[:end])
end

def show
end

def new
  @meal = Meal.new
end

def edit
end

def create
  @meal = Meal.new(meal_params)
  @meal.save
end

def update
  @meal.update(meal_params)
end

def destroy
  @meal.destroy
end

private
  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:title, :date_range, :start, :end, :color)
  end

end
