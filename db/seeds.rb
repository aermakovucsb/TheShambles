# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# games = Game.create!([{steam_id: 730, name: 'Counter-Strike: Global Offensive', price: 14.99, release_date: '2012-08-21', description: 'Counte', image: 'https://steamcdn-a.akamaihd.net/steam/apps/730/header.jpg?t=1539299939' }, { steam_id: 1, name: "test", price: 4.20, release_date: '2000-01-01', description: 'empty', image: 'https://steamcdn-a.akamaihd.net/steam/apps/240/header.jpg?t=1515613564' }])
# #background = Background.create!([{games: games.first ,name: 'Camo', price: 7, image: 'img', steam_id: 730}, {games: games.last ,name: 'Test', price: 4, image: 'imgtest', steam_id: 730}])
# ActiveRecord::Base.connection.execute "insert into backgrounds (name, price, image, steam_id, created_at, updated_at) values ('Camo',7,'img',730, '2012-08-21','2012-08-21')"
# ActiveRecord::Base.connection.execute "insert into cards (name, price, image, steam_id, foil, created_at, updated_at) values ('Anarchist',7,'IzMF03bk9WpSBq-S-ekoE33L-iLqGFHVaU25ZzQNQcXdA3g5gMEPvUZZEaiHLrVJRsl8vGuCUY7Cjc9ehDNVzDMBeXK-yX15aeAxGcXH0gbzqPGZWn36aTDBcnCBSg06G7JdNT7f9zX347uTS27PRegoEQkGLPNSoWBANcjYOBI7hYEVu2u_0UZyDBItYPpPfQ68zykWNeUgnXBGJskAnyahLsWIgQ4xa0Q_Ury0ULzLO4H3k313Cx0yHKMaesvL7zOq9ZYNbM7TbA',730, 0, '2012-08-21','2012-08-21')"


# for clean setup please run the following commands:
#   rails db:drop
#   rails db:migrate
#   rails db:seed

Game.destroy_all
Genre.destroy_all

gamers = Gamer.create([
	{gamername: 'admin', email: 'admin@admin.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer1', email: 'gamer1@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer2', email: 'gamer2@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer3', email: 'gamer3@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer4', email: 'gamer4@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer5', email: 'gamer5@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer6', email: 'gamer6@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer7', email: 'gamer7@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer8', email: 'gamer8@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer9', email: 'gamer9@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
	{gamername: 'gamer10', email: 'gamer10@gamer.com', password_digest: '$2a$10$unFFch9BQLTGgRN.lrJU6OfUScH6WeRPBXYm/3RXjwLDXVCwZ3q8S'},
])

genres = Genre.create([
	{name: 'adventure'},
	{name: 'action'},
	{name: 'rpg'},
	{name: 'simulation'},
	{name: 'indie'},
	{name: 'strategy'},
	{name: 'fps'},
	{name: 'sports'},
	{name: 'mmo'},
	{name: 'racing'},
	{name: 'puzzle'},
	{name: 'survival'},
	{name: 'arcade'},
	{name: 'retro'},
	{name: 'classic'},
	{name: 'third person'},
	{name: 'tactical'},
	{name: 'war'},
	{name: 'physics'},
	{name: 'rts'},
	{name: 'stealth'},
	{name: 'defense'},
	{name: 'board'},
	{name: 'detective'},
])

companies = Company.create([
	{name: 'nintendo'},
	{name: 'valve'},
	{name: 'rockstar'},
	{name: 'ea'},
	{name: 'activision'},
	{name: 'sony'},
	{name: 'ubisoft'},
	{name: 'sega'},
	{name: 'bioware'},
	{name: 'square enix'},
	{name: 'capcom'},
	{name: 'microsoft'},
	{name: 'bandai'},
	{name: 'konami'},
	{name: 'insomniac'},
	{name: 'infinity ward'},
	{name: 'take-two'},
	{name: 'gameloft'},
	{name: 'blizzard'},
	{name: 'zynga'},
	{name: 'bethesda'},
	{name: 'lucasarts'},
	{name: 'atari'},
	{name: 'popcap'},
	{name: 'relic'},
])

games = Game.create([
	{steam_id: 10, name: 'Counter-Strike', price: 9.99, release_date: 'Nov 1, 2000', description: 'Adipisci numquam aliquam dolorem. Sed labore sed ipsum porro. Ipsum tempora dolore non dolorem. Porro voluptatem dolorem adipisci non amet voluptatem neque. Etincidunt est sit tempora voluptatem non. Neque adipisci ut dolor ipsum ut non. Consectetur modi non sed.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/10/header.jpg?t=1528733245', genre_ids: [genres[3].id, genres[17].id, genres[20].id, genres[12].id, ], company_ids: [companies[18].id, companies[5].id, companies[9].id, ]},
	{steam_id: 20, name: 'Team Fortress Classic', price: 4.99, release_date: 'Apr 1, 1999', description: 'Eius ut adipisci etincidunt neque ut amet. Est neque est etincidunt amet. Labore sed magnam modi amet. Est quiquia quaerat consectetur modi adipisci dolorem labore. Tempora aliquam dolore quaerat. Labore amet est numquam quisquam dolor sit eius. Modi porro quiquia neque quisquam porro. Dolor aliquam neque sed quisquam dolorem magnam.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/20/header.jpg?t=1528732825', genre_ids: [genres[7].id, genres[11].id, genres[18].id, genres[20].id, genres[16].id, genres[23].id, genres[8].id, genres[13].id, ], company_ids: [companies[5].id, ]},
])

games[0].game_ratings << GameRating.new(gamer: gamers[6], rating: 5) << GameRating.new(gamer: gamers[2], rating: 3) << GameRating.new(gamer: gamers[4], rating: 1) << GameRating.new(gamer: gamers[5], rating: 5) << GameRating.new(gamer: gamers[10], rating: 1) << GameRating.new(gamer: gamers[8], rating: 1) << GameRating.new(gamer: gamers[1], rating: 6) 
games[1].game_ratings << GameRating.new(gamer: gamers[9], rating: 5) << GameRating.new(gamer: gamers[8], rating: 4) << GameRating.new(gamer: gamers[4], rating: 5) 


