class SearchPagesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  def search
    if request.post?
      if params[:search_type] == "game_by_name"
	if not params[:name].empty?
	  @games = Game.where("name LIKE ?", "%#{params[:name]}%")
	  @search_title = "Games Containing '#{params[:name]}'"
	  render "search_result_game_by_name"
	else
	  @games = []
	  @search_title = "Games Containing ''"
	  render "search_result_game_by_name"
	end
      elsif params[:search_type] == "game_by_price_range"
	params[:minimum_price] = params[:minimum_price].empty? ? 0 : params[:minimum_price]
	params[:maximum_price] = params[:maximum_price].empty? ? 1000 : params[:maximum_price]
	@games = Game.where("price >= ?", params[:minimum_price]).where("price <= ?", params[:maximum_price])
	@search_title = "Games between $#{params[:minimum_price]} and $#{params[:maximum_price]}"
	render "search_result_game_by_price_range"
      elsif params[:search_type] == "game_by_company"
	if not params[:name].empty?
	  @games = Game.joins(:companies).where(companies: { name: params[:name].downcase })
	  @search_title = "Games created by '#{params[:name].downcase}'"
	  render "search_result_game_by_company"
	end
      elsif params[:search_type] == "game_by_background_count"
	params[:minimum_Background] = params[:minimum_Background].empty? ? 1 : params[:minimum_Background]
	params[:maximum_Background] = params[:maximum_Background].empty? ? 10 : params[:maximum_Background]
	@games = Game.joins(:backgrounds).group('games.id').having("count(games.id) >= #{params[:minimum_Background]} and count(games.id) <= #{params[:maximum_Background]}")
	@search_title = "Games with #{params[:minimum_Background]} to #{params[:maximum_Background]} number of background"
	render "search_result_game_by_price_range"
      elsif params[:search_type] == "game_by_card_range"
        params[:minimum_number_of_cards] = params[:minimum_number_of_cards].empty? ? 0 : params[:minimum_number_of_cards]
        params[:maximum_number_of_cards] = params[:maximum_number_of_cards].empty? ? 15 : params[:maximum_number_of_cards]
        params[:foil] = params[:foil] ? true : false
	@games = Game.joins(:cards).where("cards.foil = :foil", foil: params[:foil]).group('games.id').having("count(games.id) >= #{params[:minimum_number_of_cards]} and count(games.id) <= #{params[:maximum_number_of_cards]}")
        @search_title = "Games between #{params[:minimum_number_of_cards]} and #{params[:maximum_number_of_cards]} number of cards"
        render "search_result_game_by_price_range"
      elsif params[:search_type] == "game_by_avg_card_price"
        params[:minimum_avg_cards_price] = params[:minimum_avg_cards_price].empty? ? 0.03 : params[:minimum_avg_cards_price]
        params[:maximum_avg_cards_price] = params[:maximum_avg_cards_price].empty? ? 1.00 : params[:maximum_avg_cards_price]
        params[:foil] = params[:foil] ? true : false
	@games = Game.select("games.*").joins(:cards).where("cards.foil = :foil", foil: params[:foil]).group("games.id").having("avg(cards.price) >= :min AND avg(cards.price) <= :max", {min: params[:minimum_avg_cards_price].to_f, max: params[:maximum_avg_cards_price].to_f})
        @search_title = "Games between #{params[:minimum_avg_cards_price]} and #{params[:maximum_avg_cards_price]} in average card price"
        render "search_result_game_by_price_range"
    elsif params[:search_type] == "game_by_avg_emote_price"
    	params[:minimum_avg_emote_price] = params[:minimum_avg_emote_price].empty? ? 0.03 : params[:minimum_avg_emote_price]
        params[:maximum_avg_emote_price] = params[:maximum_avg_emote_price].empty? ? 1.00 : params[:maximum_avg_emote_price]
	@games = Game.select("games.*").joins(:emotes).group("games.id").having("avg(emotes.price) >= :min AND avg(emotes.price) <= :max", {min: params[:minimum_avg_emote_price].to_f, max: params[:maximum_avg_emote_price].to_f})
        @search_title = "Games between #{params[:minimum_avg_emote_price]} and #{params[:maximum_avg_emote_price]} in average emote price"
        render "search_result_game_by_price_range"
    elsif params[:search_type] == "game_by_num_emote"
      params[:minimum_num_emote] = params[:minimum_num_emote].empty? ? 0.03 : params[:minimum_num_emote]
      params[:maximum_num_emote] = params[:maximum_num_emote].empty? ? 1.00 : params[:maximum_num_emote]
      @games = Game.select("games.*").joins(:emotes).group("games.id").having("count(emotes.game_id) >= :min AND count(emotes.game_id) <= :max", {min: params[:minimum_num_emote].to_i, max: params[:maximum_num_emote].to_i})
      @search_title = "Games between #{params[:minimum_num_emote]} and #{params[:maximum_num_emote]} number of emotes"
      render "search_result_game_by_price_range"
    elsif params[:search_type] == "sys_req"
      processor_rank = Processor.select('rank').find(params[:processor]).rank
      memory_rank = Memory.select('rank').find(params[:memory]).rank
      graphic_rank = Graphic.select('rank').find(params[:graphic]).rank
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
WHERE graphics.rank >= #{graphic_rank} limit 100
      """
      @games = Rails.cache.fetch('querybruh') do
	      ActiveRecord::Base.connection.select_rows(sql)
      end
#	     @games = ActiveRecord::Base.connection.select_rows(sql)
      @search_title = "Games You can Run"
      render "search_result_sys_req"
    else
      #pass
    end
    end
  end
end
