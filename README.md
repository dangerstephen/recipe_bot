# Recipe Bots

 
### What it does
This is an application that allows you to create  your own recipe book, import recipes from external sites and easily make a meal plan. In updates to come you will be able to generate a grocery list of of your current meal plan and much more. 

### How to use it
There are two ways to get your recipes. 
1) You can import a recipe all from the drop of a URL. Sound easy? It is Simply click import, paste in the URl and we will go out and grab the information and create a recipe for you. This importer is ouptomized for the following sites. 
      - AllRecipes.com
       - DamnDelicious.com 
     - Thepioneerwoman.com
    - Dont see your most used site? Contact me at we can get that fixed! 
   
   
2) Yes, I also understand that not all recipes are online, some of the best ones are hidden in our kitchen cabinets waiting for those special nights. Need not worry, you can maunaly add a recipe to your recipe book simply by just entering the baisic information. 


I also understand planning out when you are going to have your favorite recipes is hard, you dont rememebr where they are or simply dont want to take lots of time out of your day to plan when you're going to eat them. Luckily I took this into account when making this application. Ready to know when you're going to eat that delicious dish? Simply click meal plan and you will be sent to a calander for the month or even week if you choose. Then simply click a date, your recipes will appear and you select one and done. You now have your meal plan. Easy right? 

Dying to learn more? Dont worry it's all just a click away
https://recipebots.herokuapp.com/


### Tech

This is a full stack app riding the rails. Built on Ruby on Rails mixed with Javascript. It also uses a scraper script I built, that uses Nokogiri to parse data from given URL's to help generate unique recipe cards for users. For authorization I implemendted in Facebook and Google APIs to allow my users easy access and quick sign up. I also used this cool gem to make the ingreditents and directions nested forms so that you can add as many as youd like and simply remove them! Links to learn more about these technologies can be found below. 

* [Ruby On Rails] 
* [Postgresql] 
* [Javascript] 
* [Nokogiri] 
* [Cocoon] 
* [Facebook API] 
* [Google API] 

And of course feel free to check out my repo, clone it down and play with the code! Id love to hear things I can do better and make this project better! 
 

### Installation

Want to download this project to play with? Feel free, Ill even help you get started! 

```sh
$ git clone https://github.com/dangerstephen/recipe_bots.git
$ cd recipe_bots
$ bundle install 
$ rails db:create 
$ rails db:migrate 
$ rails s 
```
** These steps are assuming you have your rails enviorment configured. 

Now you should be able to go to localhost:3000, open the file in your given text editor and start messing around with the code! 





   [Ruby On Rails]: <http://rubyonrails.org/>
   [Postgresql]: <https://www.postgresql.org/>
   [Javascript]: <https://developer.mozilla.org/en-US/docs/Web/JavaScript>
   [Nokogiri]: <http://www.nokogiri.org/>
   [Cocoon]: <https://github.com/nathanvda/cocoon>
   [Facebook API]: <https://developers.facebook.com/>
   [Google API]: <https://developers.google.com/identity/>
   
   
