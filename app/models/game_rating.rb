class GameRating < ApplicationRecord
	belongs_to :gamer
	belongs_to :game
end
