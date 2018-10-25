class Game < ApplicationRecord
  has_and_belongs_to_many :genres
  has_many :backgrounds, foreign_key: :steam_id, class_name: 'Background'
  has_and_belongs_to_many :companies
 
  validates :steam_id, presence: true, numericality: {only_integer: true}, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :release_date, presence: true, timeliness: { type: :date }
  validates :description, presence: true
  validates :image, url: true
  has_many :comments, dependent: :destroy
end
