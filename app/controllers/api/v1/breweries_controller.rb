class Api::V1::BreweriesController < ApplicationController

	def index

		response = HTTParty.get("http://api.brewerydb.com/v2/search/geo/point?lat=#{params[:lat]}&lng=#{params[:lng]}&key=#{ENV['BREWERYDB_KEY']}", format: :plain)
		json = JSON.parse(response, {symbolize_names: true})
		open_breweries = json[:data].select {|brewery| brewery[:openToPublic] == 'Y'}
		open_breweries = open_breweries.map do |brewery|
			description = brewery[:brewery][:description] || ''
			website = brewery[:brewery][:website] || ''
			if brewery[:brewery][:image]
				image = brewery[:brewery][:image][:medium] || ''
			else
				image = ''
			end
			Brewery.find_or_create_by(name: brewery[:brewery][:name], phone: brewery[:phone], distance: brewery[:distance], description: description, website: website, image: image, lat: brewery[:latitude], lng: brewery[:longitude])
		end
		render json: {breweries: open_breweries}
	end

end