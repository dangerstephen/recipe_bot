class RecipesController < ApplicationController
before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe=Recipe.new
  end

  def create
    @recipe=Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: "Successfully created Recipe"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update (recipe_params)
      redirect_to @recipe, notice: "Successfully updated Recipe"
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Successfully Deleted Recipe"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end


end
