class Api::V1::UsersController < ApplicationController
	
	def create
		user = User.new(username: params[:username], password: params[:password], email: params[:email])
		if user.save
			payload = {user_id: user.id}
			render json: {user: user, jwt: issue_token(payload)}
		else
		end
	end

	def users_recipes
		render json: {recipes: current_user.recipes}
	end

	def edit
		current_user.image = imageParams[:base64]
		byebug
		current_user.save
	end

	private
	def imageParams
		params.require(:image).permit(:base64)	
	end

end