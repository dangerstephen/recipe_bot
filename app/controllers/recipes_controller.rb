class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, expect: [:show]

    def index
        @recipes = Recipe.all

    end

    def show
    end

    def new
        @recipe = current_user.recipes.create
    end

    def create
        @recipe = current_user.recipes.create(recipe_params)
        if @recipe.save
            redirect_to recipes_path, notice: "Successfully created Recipe"
        else
            render 'new'
        end
    end

    def edit
        if current_user.id == @recipe.user.id
        else
            redirect_to root_path, alert: "You dont have permission to edit this!"
        end
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

    def report
    #   generate_recipe()
      RecipeWorker.perform_async(dogs)
      render text: "Request to generate recipe added to queue"
    end


    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end


end
