json.extract! card, :id, :name, :price, :image, :game_id, :foil, :created_at, :updated_at
json.url card_url(card, format: :json)
