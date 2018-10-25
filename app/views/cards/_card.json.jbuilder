json.extract! card, :id, :name, :price, :image, :steam_id, :foil, :created_at, :updated_at
json.url card_url(card, format: :json)
