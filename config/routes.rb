Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		post '/signup', to: 'users#create'
  		post '/login', to: 'auth#create'
  		post '/recipes', to: 'recipes#create'
  		post '/user/recipes', to: 'users#users_recipes'
  		get '/recipes', to: 'recipes#index'
  		post '/user/edit', to: 'users#edit'
  		get '/recipe/:id', to: 'recipes#show'
  		post '/user_recipes', to: 'user_recipes#create'
  		post '/follows', to: 'follows#index'
  		post '/follow/new', to: 'follows#create'
  		get '/user/current', to: 'users#current'
  		get '/user/:id', to: 'users#show'
  		post '/review/new', to: 'reviews#create'
  		get '/users', to: 'users#index'
  		post '/groups', to: 'groups#create'
  	end
  end
end
