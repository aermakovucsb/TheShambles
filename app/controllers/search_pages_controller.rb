class SearchPagesController < ApplicationController
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
      elsif params[:search_type] == "game_by_card_range"
		params[:minimum_number_of_cards] = params[:minimum_number_of_cards].empty? ? 0 : params[:minimum_number_of_cards]
		params[:maximum_number_of_cards] = params[:maximum_number_of_cards].empty? ? 15 : params[:maximum_number_of_cards]
		params[:foil] = params[:foil] ? 1 : 0
		@games = Game.select("games.*").joins("JOIN  cards ON cards.steam_id = games.steam_id").where("cards.foil = :foil", foil: params[:foil]).group("cards.steam_id").having("count(cards.steam_id) >= :min AND count(cards.steam_id) <= :max", {min: params[:minimum_number_of_cards].to_i, max: params[:maximum_number_of_cards].to_i})
		@search_title = "Games between #{params[:minimum_number_of_cards]} and #{params[:maximum_number_of_cards]} number of cards"
		render "search_result_game_by_price_range"
      end
    else
      #pass
    end
  end
end
