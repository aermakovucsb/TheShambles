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
		elsif params[:search_type] == "game_by_company"
			if not params[:name].empty?
				@companies= Company.where("name LIKE ?", "%#{params[:name]}%")
				@search_title = "Games created by '#{params[:name]}'"
				render "search_result_game_by_company"
		  end
      elsif params[:search_type] == "game_by_background_count"
      	params[:minimum_Background] = params[:minimum_Background].empty? ? 1 : params[:minimum_Background]
		params[:maximum_Background] = params[:maximum_Background].empty? ? 10 : params[:maximum_Background]
		@games = Game.select("games.*").joins(:backgrounds).group("backgrounds.game_id").having("count(backgrounds.game_id) >= :min AND count(backgrounds.game_id) <= :max", {min: params[:minimum_Background].to_i, max: params[:maximum_Background].to_i})
		@search_title = "Games with #{params[:minimum_Background]} to #{params[:maximum_Background]} number of background"
		render "search_result_game_by_price_range"
      elsif params[:search_type] == "game_by_card_range"
        params[:minimum_number_of_cards] = params[:minimum_number_of_cards].empty? ? 0 : params[:minimum_number_of_cards]
        params[:maximum_number_of_cards] = params[:maximum_number_of_cards].empty? ? 15 : params[:maximum_number_of_cards]
        params[:foil] = params[:foil] ? true : false
        @games = Game.select("games.*").joins(:cards).where("cards.foil = :foil", foil: params[:foil]).group("cards.game_id").having("count(cards.game_id) >= :min AND count(cards.game_id) <= :max", {min: params[:minimum_number_of_cards].to_i, max: params[:maximum_number_of_cards].to_i})
        @search_title = "Games between #{params[:minimum_number_of_cards]} and #{params[:maximum_number_of_cards]} number of cards"
        render "search_result_game_by_price_range"
      elsif params[:search_type] == "game_by_avg_card_price"
        params[:minimum_avg_cards_price] = params[:minimum_avg_cards_price].empty? ? 0 : params[:minimum_avg_cards_price]
        params[:maximum_avg_cards_price] = params[:maximum_avg_cards_price].empty? ? 15 : params[:maximum_avg_cards_price]
        params[:foil] = params[:foil] ? true : false
        @games = Game.select("games.*").joins(:cards).where("cards.foil = :foil", foil: params[:foil]).group("cards.game_id").having("avg(cards.price) >= :min AND avg(cards.price) <= :max", {min: params[:minimum_avg_cards_price].to_f, max: params[:maximum_avg_cards_price].to_f})
        @search_title = "Games between #{params[:minimum_avg_cards_price]} and #{params[:maximum_avg_cards_price]} number of cards"
        render "search_result_game_by_price_range"
      end
    else
      #pass
    end
  end
end
