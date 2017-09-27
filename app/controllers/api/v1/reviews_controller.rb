class Api::V1::ReviewsController < ApplicationController

	def create
		review = Review.create(user_id: current_user.id, recipe_id: params[:recipeId], rating: params[:review][:rating], text: params[:review][:text])
		formatted_review = review.attributes
		formatted_review[:author] = review.user
		render json: {review: formatted_review}
	end

end