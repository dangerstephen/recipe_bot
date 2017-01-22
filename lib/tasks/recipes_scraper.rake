desc "Fetch recipe info"
task :recipes_scraper => :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "http://damndelicious.net/2016/11/04/chicken-parmesan-grilled-cheese/"
  doc = Nokogiri::HTML(open(url))
    recipe = Recipe.create do |recipe|
      recipe.user_id = 1
    recipe.title = doc.at_css("h1").text
    recipe.description = doc.at_css("em").text
  end

  doc.css(".ingredient").each do |node|
  Ingredient.create!(name: node.text, recipe_id: Recipe.last.id)
end

  doc.css(".instructions li").each do |node|
  Direction.create!(step: node.text, recipe_id: Recipe.last.id)
end
end
