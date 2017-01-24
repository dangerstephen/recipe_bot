Rails.application.routes.draw do

  # root 'recipes#index'
  root 'pages#home'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks'
                              }
  resources :recipes

  post "/run" => "recipes#run", as: "recipes_run"
  get "/my_recipes" =>"recipes#my_recipes", as: "my_recipes"
  get "/import_new_recipe" => "recipes#import", as: "import_recipe"

  resources :meals
  get "/calander" => 'meals#calander'



end
