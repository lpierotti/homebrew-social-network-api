class Api::V1::UsersController < ApplicationController
	
	def create
		user = User.new(username: params[:username], password: params[:password], email: params[:email])
		if user.save
			payload = {user_id: user.id}
			render json: {user: user, jwt: issue_token(payload)}
		else
		end
	end

end