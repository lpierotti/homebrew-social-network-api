
class Api::V1::AuthController < ApplicationController

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			payload = {user_id: user.id}
			token = issue_token(payload)
			render json: {user: user, jwt: token}
		else
			render json: {error: "The email or pssword is incorrect!"}
		end
	end
end