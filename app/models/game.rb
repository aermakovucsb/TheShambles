class Game < ApplicationRecord

  has_many :backgrounds
  has_many :cards
  has_many :emotes

  #has_many :comments, dependent: :destroy

  has_and_belongs_to_many :companies

  has_many :game_ratings
  has_many :gamers, through: :game_ratings
  
  has_many :comments
  has_many :gamers, through: :comments

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :gamers
 
  validates :steam_id, presence: true, numericality: {only_integer: true}, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :release_date, presence: true, timeliness: { type: :date }
  validates :description, presence: true
  validates :image, url: true
end
