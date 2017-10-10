class User < ApplicationRecord
	has_secure_password
	validates :username, uniqueness: true
	validates :email, uniqueness: true

	has_many :user_recipes
	has_many :recipes, through: :user_recipes
	has_many :reviews
	has_many :user_groups
	has_many :groups, through: :user_groups

end