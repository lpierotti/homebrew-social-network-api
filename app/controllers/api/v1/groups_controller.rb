class Api::V1::GroupsController < ApplicationController

	def create
		group = Group.create(name: params[:name], description: params[:description])
		members = params[:members].each do |name|
			user = User.find_by(username: name)
			UserGroup.create(user_id: user.id, group_id: group.id)
			user
		end
		display_group = group.attributes
		display_group[:members] = members
		render json: {group: display_group}
	end

	def show
		group = Group.find_by(id: params[:id])
		new_group = group.attributes
		new_group[:members] = group.users
		render json: {group: new_group}
	end

end