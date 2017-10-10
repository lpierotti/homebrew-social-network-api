# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


image1 = "http://res.cloudinary.com/dflt9qlwf/image/upload/v1507219292/pkge5p0ubbwwvjuvpy7l.jpg"
image2 = "http://res.cloudinary.com/dflt9qlwf/image/upload/v1507219276/cbdtmqnxf2uigrl6zc5f.jpg"
image3 = "http://res.cloudinary.com/dflt9qlwf/image/upload/v1507219260/mgolcvifbdjwbnx0jyhs.jpg"
image4 = "http://res.cloudinary.com/dflt9qlwf/image/upload/v1507219233/vojxrde7z8amkazrrczw.jpg"
image5 = "http://res.cloudinary.com/dflt9qlwf/image/upload/v1507207567/nqtjcvlix99bil0zf6ey.jpg"
arr = [image1, image2, image3, image4, image5]

for i in 0..5
	User.create(username: Faker::RickAndMorty.character, email: Faker::RickAndMorty.character, password: 'l')
	Ingredient.create(name: Faker::Beer.hop)
	Ingredient.create(name: Faker::Beer.yeast)
	Ingredient.create(name: Faker::Beer.malts)
	Ingredient.create(name: Faker::Beer.malts)
	Ingredient.create(name: Faker::Beer.hop)
	Recipe.create(name: Faker::Beer.name, description: Faker::RickAndMorty.quote, instructions: Faker::Lorem.paragraph(2, false, 4), og: 1.05, fg: 1.01, abv: 5.25, type_of_brew: 'Extract' , style: Faker::Beer.style, image: arr[i -1])
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_weight("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_weight("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_volume("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_volume("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_volume("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_volume("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_volume("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	RecipeIngredient.create(amount: Faker::Number.decimal(2), unit: Faker::Measurement.metric_volume("all"), ingredient_id: Faker::Number.between(1, Ingredient.all.length), recipe_id: i)
	UserRecipe.create(user_id: Faker::Number.between(1, User.all.length), recipe_id: Faker::Number.between(1, Recipe.all.length))
	UserRecipe.create(user_id: Faker::Number.between(1, User.all.length), recipe_id: Faker::Number.between(1, Recipe.all.length))
	UserRecipe.create(user_id: Faker::Number.between(1, User.all.length), recipe_id: Faker::Number.between(1, Recipe.all.length))

end