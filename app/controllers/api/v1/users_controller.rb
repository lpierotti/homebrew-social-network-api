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
		user = User.find_by(id: params[:id])
		render json: {recipes: user.recipes}
	end

	def edit
		byebug
		user = current_user
		user.image = imageParams[:url]
		user.save
		byebug
		render json: {image: current_user.image}
	end

	def follows
		user = User.find_by(id: params[:id])
		followers = Follow.find_by(followee_id: user.id)
		followees = Follow.find_by(follower_id: user.id)
		render json: {followers: followers, followees: followees}
	end

	private
	def imageParams
		params.require(:user).permit(:url)	
	end

end