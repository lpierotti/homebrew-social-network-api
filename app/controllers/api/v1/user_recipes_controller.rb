class Api::V1::UserRecipesController < ApplicationController

	def create
		UserRecipe.find_or_create_by(user_id: current_user.id, recipe_id: params[:id])
	end

end