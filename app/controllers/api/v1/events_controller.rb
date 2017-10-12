class Api::V1::EventsController < ApplicationController

	def create
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:number]}+#{params[:street]},+#{params[:city]},+#{params[:state]}&key=AIzaSyDvg8oPEvdVVQpUY2KZ_-vDEkSzHaYwCQk", format: :plain)
		json = JSON.parse(response, {symbolize_names: true})
		event = Event.create(name: params[:name], description: params[:description], number: params[:number], street: params[:street], city: params[:city], state: params[:state], start: params[:start], end: params[:end], lat: json[:results][0][:geometry][:location][:lat], lng:json[:results][0][:geometry][:location][:lng], group_id: params[:id])
		user_event = UserEvent.create(user_id: current_user.id, event_id: event.id)
		event_with_guests = event.attributes
		event_with_guests[:guests] = event.users
		render json: {event: event_with_guests}
	end

	def index 
		group = Group.find_by(id: params[:id])
		events = group.events
		events_with_guests = events.map do |event|
			new_event = event.attributes
			new_event[:guests] = event.users
			new_event
		end
		render json: {events: events_with_guests}
	end
end