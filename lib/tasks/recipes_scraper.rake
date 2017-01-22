desc "Fetch recipe info"
task :recipes_scraper => :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "http://damndelicious.net/2017/01/16/turkey-and-spinach-veggie-lasagna/"
  doc = Nokogiri::HTML(open(url))
    recipe = Recipe.create do |recipe|
      recipe.user_id = 1
    recipe.title = doc.at_css("h1").text
    recipe.description = doc.at_css("em").text
  end
  ingredients = Ingredient.create do |ingredient|
    ingredient.recipe_id = Recipe.last.id
    ingredient.name = doc.at_css(".ingredient").text
  end
  directions = Direction.create do |direction|
    direction.recipe_id = Recipe.last.id
    direction.step = doc.at_css(".instructions li").text
  end
end
