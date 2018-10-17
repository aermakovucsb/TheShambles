class Background < ApplicationRecord
	belongs_to :games, foreign_key: :steam_id, class_name: 'Game'
	validates :name, presence: true
	validates :price, presence: true, numericality: true
	validates :image,  presence: true
	validates :steam_id, presence: true, numericality: {only_integer: true}
end
