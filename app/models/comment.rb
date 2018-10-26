class Comment < ApplicationRecord
  belongs_to :gamer
  belongs_to :game 
  # validates :description, presence: true, length: { minimum: 4, maximum: 140 }
  # validates :gamer_id, presence: true
  # validates :game_id, presence: true
  # default_scope -> { order(updated_at: :desc)}
end
