class User < ApplicationRecord
	has_secure_password
	
	has_many :user_recipes
	has_many :recipes, through: :user_recipes
	mount_base64_uploader :image, ImageUploader

end