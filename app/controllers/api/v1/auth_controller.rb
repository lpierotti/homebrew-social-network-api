class Api::V1::AuthController < ApplicationRecord

	def create
		user = User.find_by(username: params)
	end

end