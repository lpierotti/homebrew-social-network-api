class Api::V1::RecipesController < ApplicationController

	def create
		recipe = Recipe.create(name: params[:name], style: params[:style], type: params[:type], description: params[:description], instructions: params[:instructions], og: params[:abvCalc][:og], fg: params[:abvCalc][:fg], abv: params[:abvCalc][:abv] img: '')
		ingredients = params[:ingredientObjects].each do |ingredient|
			newIngredient = Ingredient.create(name: ingredient[:name])
			RecipeIngredients.create(recipe_id: recipe.id, ingredient_id: newIngredient.id, amount: ingredient[:amount], unit: ingredient[:unit])
		end
		UserRecipe.create(user_id: current_user.id, recipe_id: recipe.id)
	end
end