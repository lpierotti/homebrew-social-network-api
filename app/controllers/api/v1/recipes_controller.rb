class Api::V1::RecipesController < ApplicationController

	def create
		recipe = Recipe.create(name: params[:name], style: params[:style], type_of_brew: params[:type], description: params[:description], instructions: params[:instructions], og: params[:abvCalc][:og], fg: params[:abvCalc][:fg], abv: params[:abvCalc][:abv], image: '')
		ingredients = params[:ingredientObjects].each do |ingredient|
			newIngredient = Ingredient.find_or_create_by(name: ingredient[:name])
			RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: newIngredient.id, amount: ingredient[:amount], unit: ingredient[:unit])
		end
		UserRecipe.create(user_id: current_user.id, recipe_id: recipe.id)
	end

	def index
		recipes = Recipe.all
		render json: {recipes: recipes}
	end
end