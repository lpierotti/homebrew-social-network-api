class Api::V1::ReviewsController < ApplicationController

	def create
		review = Review.create(user_id: current_user.id, recipe_id: params[:recipeId], rating: params[:review][:rating], text: params[:review][:text])
		render json: {review: review}
	end

end