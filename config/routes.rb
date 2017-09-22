Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		post '/signup', to: 'users#create'
  		post '/login', to: 'auth#create'
  		post '/recipes', to: 'recipes#create'
  		get '/user/recipes', to: 'users#users_recipes'
  		get '/recipes', to: 'recipes#index'
  		post '/user/edit', to: 'users#edit'
  	end
  end
end
