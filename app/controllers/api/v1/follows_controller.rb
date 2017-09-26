class Api::V1::FollowsController < ApplicationController

	def create
		user = current_user
		follow = Follow.create(follower_id: user.id, followee_id: params[:id])
		render json: {followee: follow.followee_id}
	end

	def index
		user = User.find_by(id: params[:id])
		followers = Follow.where("followee_id = ?", user.id).pluck(:follower_id)
		followees = Follow.where("follower_id = ?", user.id).pluck(:followee_id)
		render json: {follower_ids: followers, followee_ids: followees}
	end

end