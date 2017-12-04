# Brew For You
Brew for you is a social networking site for homebrewers. As a homebrewer myself, I noticed there were no sites that brought homebrewers together and allowed for easy recipe sharing. No matter the skill level of the brewer, Brew For You will help to connect homebrewers and allow them to share tips, experiences, and years of knowledge with their fellow brewers. By allowing homebrewers to create groups and message in real time, the site creates a sense of community no matter where you are.

The live site can be found at https://brewforyou.herokuapp.com/

## Features
- Follow other users to keep up to date with their newest brews
- Upload recipes from your own collection
- Save recipes you find interesting to your profile for reference later
- Write reviews for recipes
- Create groups/clubs which feature instant messaging using websockets, group/club events that can be created and are displayed on a Google maps component
- Search for breweries based on your current location which are displayed on Google maps component

## Technology used
- Ruby on Rails API
- React + Redux UI
- Websockets through Rails built in Action Cable for instant messaging
- Google maps API for map display and for reverse geocoding addresses
- BreweryDB API used to search for breweries near your current location
- Jest + Enzyme for testing
- Semantic React for styling

## Features to be added
- Working on writing tests
- Improve Styling
