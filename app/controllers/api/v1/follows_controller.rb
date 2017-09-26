class Api::V1::FollowsController < ApplicationController

	def create
		byebug
		user = current_user
		follow = Follow.create(follower_id: user.id, followee_id: params[:id])
		followee = User.find_by(id: params[:id])
		render json: {followee: follow}
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