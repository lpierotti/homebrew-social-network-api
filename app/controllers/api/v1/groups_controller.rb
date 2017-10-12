class Api::V1::GroupsController < ApplicationController

	def create
		image = params[:image] || ''
		group = Group.create(name: params[:name], description: params[:description], image: image)
		members = params[:members].each do |name|
			user = User.find_by(username: name)
			UserGroup.create(user_id: user.id, group_id: group.id)
			user
		end
		user = current_user
		UserGroup.find_or_create_by(user_id: user.id, group_id: group.id)
		members << user
		display_group = group.attributes
		display_group[:members] = members
		render json: {group: display_group}
	end

	def show
		group = Group.find_by(id: params[:id])
		new_group = group.attributes
		new_group[:members] = group.users
		if Chatroom.find_by(name: "Group#{group.id}")
			new_group[:messages] = Chatroom.find_by(name: "Group#{group.id}").messages.map do |message| 
				new_message = {}
				if message[:user_id] == current_user.id 
					new_message[:type] = 0
				else 
					new_message[:type] = 1
				end
				new_message[:image] = User.find_by(id: message[:user_id]).image || "http://res.cloudinary.com/dflt9qlwf/image/upload/v1506547359/pmmbf4o9ebr7z09l8oat.png"
				new_message[:text] = message[:body]
				new_message
			end
		end
		new_group[:events] = group.events
		render json: {group: new_group}
	end

	def users_groups
		user = current_user
		groups = user.groups
		new_groups = groups.map do |group|
			new_group = group.attributes
			new_group[:members] = group.users
			new_group
		end
		render json: {userGroups: new_groups}
	end

end