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
      elsif params[:search_type] == "game_by_background_count"
      	params[:minimum_Background] = params[:minimum_Background].empty? ? 1 : params[:minimum_Background]
				params[:maximum_Background] = params[:maximum_Background].empty? ? 10 : params[:maximum_Background]
				@games = Game.select("games.*").joins("JOIN  backgrounds ON backgrounds.steam_id = games.steam_id").group("backgrounds.steam_id").having("count(backgrounds.steam_id) >= :min AND count(backgrounds.steam_id) <= :max", {min: params[:minimum_Background].to_i, max: params[:maximum_Background].to_i})
				@search_title = "Games with #{params[:minimum_Background]} to #{params[:maximum_Background]} number of background"
				render "search_result_game_by_price_range"
			end
    else
      #pass
    end
  end
end
