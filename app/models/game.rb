class Game < ApplicationRecord

  has_one :system_requirement

  has_many :backgrounds
  has_many :cards
  has_many :emotes

  has_and_belongs_to_many :companies

  has_many :game_ratings
  has_many :gamers, through: :game_ratings
  
  has_many :comments, dependent: :destroy
  has_many :gamers, through: :comments

  has_many :price_histories

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :gamers
  has_many :likes, dependent: :destroy
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size    
  end
 
  validates :steam_id, presence: true, numericality: {only_integer: true}, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :release_date, presence: true, timeliness: { type: :date }
  validates :description, presence: true
  validates :image, url: true

  def self.sysReq(processor_rank, memory_rank, graphic_rank, offset, limit)
      sql = """
	    SELECT games.id, games.name, games.steam_id, games.price, games.release_date
	    FROM games
	    INNER JOIN system_requirements
	    ON games.id = system_requirements.game_id
	    INNER JOIN processors
	    ON system_requirements.processor_id = processors.id
	    WHERE processors.rank >= #{processor_rank}
	    INTERSECT
	    SELECT games.id, games.name, games.steam_id, games.price, games.release_date
	    FROM games
	    INNER JOIN system_requirements
	    ON games.id = system_requirements.game_id
	    INNER JOIN memories
	    ON system_requirements.memory_id = memories.id
	    WHERE memories.rank >= #{memory_rank}
	    INTERSECT
	    SELECT games.id, games.name, games.steam_id, games.price, games.release_date
	    FROM games
	    INNER JOIN system_requirements
	    ON games.id = system_requirements.game_id
	    INNER JOIN graphics
	    ON system_requirements.graphic_id = graphics.id
	    WHERE graphics.rank >= #{graphic_rank} offset #{offset} limit #{limit}
      """
      ActiveRecord::Base.connection.select_rows(sql)
  end


end
