class Card < ApplicationRecord
  belongs_to :game
  #validates :name, presence: true
  #validates :price, presence: true
  #validates :image, presence: true
  #validates :game_id, presence: true
end
