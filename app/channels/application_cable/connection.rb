module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user

  	def decoded_token(token)

		begin
			JWT.decode(token, "beerwinemead")
		rescue JWT::DecodeError
			''
		end
	end

	def token
		bearer_token = request.params['token']
		jwt_token = bearer_token
	end

	def current_user
		decoded_hash = decoded_token(token)
		if !decoded_hash.empty?
			user_id = decoded_hash[0]["user_id"]
			user = User.find(user_id)
		else
		end
	end
  end
end
