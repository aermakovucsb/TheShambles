class Like < ApplicationRecord
    belongs_to :gamer
    belongs_to :game
    
    validates_uniqueness_of :gamer, scope: :game
  end