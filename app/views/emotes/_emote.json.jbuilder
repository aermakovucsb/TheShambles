json.extract! emote, :id, :name, :price, :url, :appid, :created_at, :updated_at
json.url emote_url(emote, format: :json)
