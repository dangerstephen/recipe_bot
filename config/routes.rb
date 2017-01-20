Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'pages#home'

  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks'
                              }
  get "/recipes/report" => "recipes#report", as: "recipes_report"
  resources :recipes

end
