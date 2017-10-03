class Api::V1::FollowsController < ApplicationController

	def create
		user = current_user
		follow = Follow.find_or_create_by(follower_id: user.id, followee_id: params[:id])
		followee = User.find_by(id: params[:id])
		follower = User.find_by(id: current_user.id)
		render json: {followee: followee, follower: follower}
	end

	def index
		user = User.find_by(id: params[:id])
		followers = Follow.where("followee_id = ?", user.id).pluck(:follower_id)
		followers = followers.map do |follower| 
			User.find_by(id: follower)
		end
		followees = Follow.where("follower_id = ?", user.id).pluck(:followee_id)
		followees = followees.map do |followee|
			User.find_by(id: followee)
		end
		render json: {followers: followers, followees: followees}
	end

end