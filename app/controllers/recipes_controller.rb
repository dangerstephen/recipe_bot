class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, expect: [:show]

    require 'nokogiri'
    require 'open-uri'

    def run
        url = p params[:my_url]
        if url.include? "damndelicious.net"
            doc = Nokogiri::HTML(open(url))
            recipe = Recipe.create do |recipe|
                recipe.user_id = current_user.id
                recipe.title = doc.at_css("h1").text
                recipe.description = doc.at_css("em").text
                recipe.url = url
                recipe.image = doc.at('//img[@class="photo nopin pib-hover-img"]/@src').to_s
                # recipe end
            end
            doc.css(".ingredient").each do |classes|
                Ingredient.create!(name: classes.text, recipe_id: Recipe.last.id)
                # instruction end
            end
            doc.css(".instructions li").each do |classes|
                Direction.create!(step: classes.text, recipe_id: Recipe.last.id)
                # direction end
            end
            redirect_to recipe, notice: "Scraped Recipe, please check to verify everything looks correct"
        elsif url.include? "thepioneerwoman.com"
            doc = Nokogiri::HTML(open(url))
            recipe = Recipe.create do |recipe|
                recipe.user_id = current_user.id
                recipe.title = doc.at_css(".recipe-title").text
                # recipe.description = doc.at_css(".col-xs-7 p").text
                recipe.image = doc.at('//img[@class="alignnone size-full wp-image-91195"]/@src').to_s
                recipe.url = url
                # recipe end
            end
            doc.css(".list-ingredients li").each do |classes|
                Ingredient.create!(name: classes.text, recipe_id: Recipe.last.id)
                # instruction end
            end
            doc.css(".panel+ .panel .panel-body").each do |classes|
                Direction.create!(step: classes.text, recipe_id: Recipe.last.id)
                # direction end
            end
            redirect_to recipe, notice: "Scraped Recipe, please check to verify everything looks correct"
        elsif url.include? "allrecipes.com"
            doc = Nokogiri::HTML(open(url))
            recipe = Recipe.create do |recipe|
                recipe.user_id = current_user.id
                recipe.title = doc.at_css(".recipe-summary__h1").text
                recipe.description = doc.at_css(".submitter__description").text
                recipe.url = url
                recipe.image = doc.at('//img[@class="rec-photo"]/@src').to_s

                # recipe end
            end
            doc.css(".added").each do |classes|
                Ingredient.create!(name: classes.text, recipe_id: Recipe.last.id)
                # instruction end
            end
            doc.css(".step").each do |classes|
                Direction.create!(step: classes.text, recipe_id: Recipe.last.id)
                # direction end
            end
            redirect_to recipe, notice: "Scraped Recipe, please check to verify everything looks correct"
        else
            redirect_to new_recipe_url, alert: "the domain your trying to access is not yet supported"
            # if statement end
        end
        # Def run end
    end

    def index
        @recipes = Recipe.all.order("created_at DESC")
    end

    def my_recipes
        @recipes = current_user.recipes.order("created_at DESC")
    end

    def show
    end

    def new
        @recipe = current_user.recipes.create
    end

    def create
        @recipe = current_user.recipes.create(recipe_params)
        if @recipe.save
            redirect_to @recipe, notice: "Successfully created Recipe"
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

    def scraper
        call_rake :recipes_scraper
        redirect_to root
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :image, :url, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

end
