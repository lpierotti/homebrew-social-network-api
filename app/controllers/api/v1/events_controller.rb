class Api::V1::EventsController < ApplicationController

	def create
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:number]}+#{params[:street]},+#{params[:city]},+#{params[:state]}&key=AIzaSyDvg8oPEvdVVQpUY2KZ_-vDEkSzHaYwCQk", format: :plain)
		json = JSON.parse(response, {symbolize_names: true})
		event = Event.create(name: params[:name].titleize, description: params[:description], number: params[:number], street: params[:street].titleize, city: params[:city].titleize, state: params[:state], start: params[:start], end: params[:end], lat: json[:results][0][:geometry][:location][:lat], lng:json[:results][0][:geometry][:location][:lng], group_id: params[:id])
		user_event = UserEvent.create(user_id: current_user.id, event_id: event.id)
		event_with_guests = event.attributes
		event_with_guests[:guests] = event.users
		render json: {event: event_with_guests}
	end

	def index 
		group = Group.find_by(id: params[:id])
		events = group.events
		render json: {events: events}
	end

	def show 
		event = Event.find_by(id: params[:id])
		event_with_guests = event.attributes
		event_with_guests[:guests] = event.users
		render json: {event: event_with_guests}
	end

	def add_guest
		UserEvent.create(user_id:current_user.id, event_id: params[:id])
		event = Event.find_by(id: params[:id])
		new_event = event.attributes
		new_event[:guests] = event.users
		render json: {event: new_event}
	end

	def remove_guest
		rsvp = UserEvent.find_by(user_id:current_user.id, event_id: params[:id])
		rsvp.destroy
		event = Event.find_by(id: params[:id])
		new_event = event.attributes
		new_event[:guests] = event.users
		render json: {event: new_event}
	end
end