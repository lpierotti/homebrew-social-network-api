class Follower < ApplicationRecord
	belongs_to :user, foreign_key: 'follower_id'
	belongs_to :user, foreign_key: 'followee_id'
end