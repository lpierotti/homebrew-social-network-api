class Api::V1::FollowController < ApplicationController

	def create
		user = current_user
		follow = Follow.create(follower_id: user.id, followee_id: params[:id])
		render json: {follow: follow}
	end

	def index
		user = User.find_by(id: params[:id])
		followers = Follow.find_by(followee_id: user.id)
		followees = Follow.find_by(follower_id: user.id)
		render json: {followers: followers, followees: followees}
	end

end