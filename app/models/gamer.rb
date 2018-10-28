class Gamer < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :gamername, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 },allow_nil: true
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :game_ratings
  has_many :games, through: :game_ratings

  has_many :comments
  has_many :games, through: :comments

  has_and_belongs_to_many :games
  has_many :likes, dependent: :destroy
end
