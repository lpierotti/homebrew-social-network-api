class Api::V1::UsersController < ApplicationController
	
	def create
		user = User.new(username: params[:username], password: params[:password], email: params[:email])
		if user.save
			payload = {user_id: user.id}
			render json: {user: user, jwt: issue_token(payload)}
		else
			name_errors = ''
			email_errors = ''
			if user.errors.messages[:username][0]
				name_errors = "Username #{user.errors.messages[:username][0]}"
			elsif user.errors.messages[:email][0]
				email_errors = "Email #{user.errors.messages[:email][0]}"
			end
			render json: {error: name_errors + " " + email_errors}
		end
	end

	def users_recipes
		user = User.find_by(id: params[:id])
		render json: {recipes: user.recipes}
	end

	def edit
		user = current_user
		user.image = imageParams[:url]
		user.save
		render json: {image: current_user.image}
	end

	def show
		user = User.find_by(id: params[:id])
		render json: {viewing_user: user}
	end	

	def current
		user = current_user
		render json: {user: user}
	end

	def index 
		users = User.all 
		render json: {users: users}
	end

	private
	def imageParams
		params.require(:user).permit(:url)	
	end

end