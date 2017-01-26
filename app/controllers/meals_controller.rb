class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :set_recipe_names
  before_action :classes
  before_action :authenticate_user!




def index
  @meals = current_user.meals.where(start: params[:start]..params[:end])
end

def show
end


def new
  @meal = Meal.new
end

def edit
end

def create
  @meal = Meal.create(meal_params)
  redirect_to meal_plan_path
end

def update
  @meal.update(meal_params)
  redirect_to meal_plan_path

end

def destroy
  @meal.destroy
  redirect_to meal_plan_path

end

private
  def set_meal
    @meal = Meal.find(params[:id])
  end

  def set_recipe_names
    @recipes_arr = current_user.recipes.pluck :title
  end

  def meal_params
    params.require(:meal).permit(:title, :date_range, :start, :end, :color, :user_id)
  end

  def classes
    @home_page = true
  end



end
