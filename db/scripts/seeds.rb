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
	{steam_id: 10, name: 'Counter-Strike', price: 9.99, release_date: 'Nov 1, 2000', description: 'Non non eius adipisci velit ipsum. Velit labore magnam adipisci ut. Adipisci ipsum consectetur modi magnam. Velit dolorem numquam non quiquia amet tempora modi. Porro quiquia magnam ut labore aliquam. Quisquam modi eius quisquam tempora labore adipisci.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/10/header.jpg?t=1528733245', genre_ids: [genres[15].id, genres[19].id, genres[8].id, ], company_ids: [companies[14].id, companies[9].id, companies[8].id, companies[20].id, ], gamer_ids: [gamers[9].id, gamers[2].id, gamers[3].id, gamers[8].id, gamers[5].id, gamers[1].id, gamers[0].id, gamers[4].id, gamers[7].id, gamers[6].id, ]},
	{steam_id: 20, name: 'Team Fortress Classic', price: 4.99, release_date: 'Apr 1, 1999', description: 'Voluptatem modi dolore tempora quiquia. Numquam aliquam eius aliquam. Consectetur consectetur est magnam velit ut. Modi porro quaerat sit velit. Numquam dolore adipisci non quiquia est ipsum adipisci. Modi modi amet adipisci ipsum voluptatem dolore. Est eius sit dolor neque aliquam numquam aliquam. Sed etincidunt numquam ut consectetur velit consectetur. Modi quaerat modi amet voluptatem. Amet quisquam ut quiquia amet sit.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/20/header.jpg?t=1528732825', genre_ids: [genres[6].id, genres[3].id, genres[16].id, genres[22].id, genres[4].id, genres[19].id, ], company_ids: [companies[3].id, companies[24].id, companies[20].id, ], gamer_ids: [gamers[2].id, gamers[4].id, gamers[8].id, gamers[6].id, gamers[5].id, ]},
])

games[0].game_ratings << GameRating.new(gamer: gamers[7], rating: 4) << GameRating.new(gamer: gamers[6], rating: 1) << GameRating.new(gamer: gamers[2], rating: 2) << GameRating.new(gamer: gamers[8], rating: 1) << GameRating.new(gamer: gamers[4], rating: 4) << GameRating.new(gamer: gamers[3], rating: 1) << GameRating.new(gamer: gamers[5], rating: 3) << GameRating.new(gamer: gamers[9], rating: 4) << GameRating.new(gamer: gamers[10], rating: 2) << GameRating.new(gamer: gamers[1], rating: 5) 
games[1].game_ratings << GameRating.new(gamer: gamers[7], rating: 1) << GameRating.new(gamer: gamers[5], rating: 4) 


games[0].comments << Comment.new(gamer: gamers[3], description: 'Modi porro neque consectetur porro. Quiquia quiquia porro ipsum quisquam. Voluptatem quisquam sed voluptatem quaerat. Quisquam aliquam quiquia velit. Numquam quaerat ipsum adipisci sit. Dolor quisquam quisquam eius etincidunt velit dolorem eius.') << Comment.new(gamer: gamers[4], description: 'Ut ut non sit dolor ipsum etincidunt magnam. Voluptatem porro adipisci sed. Porro tempora dolorem sit voluptatem. Neque sit tempora tempora adipisci dolorem. Labore quiquia amet quisquam quaerat eius etincidunt non. Tempora aliquam dolore dolore est consectetur numquam velit. Magnam tempora consectetur neque ipsum sit consectetur. Est non eius dolorem. Sed quisquam sit porro dolore neque magnam dolore.') << Comment.new(gamer: gamers[10], description: 'Dolor quaerat porro est quaerat. Dolorem aliquam etincidunt sed voluptatem velit quaerat. Quisquam labore sed quisquam tempora amet consectetur sed. Numquam amet tempora modi quisquam. Adipisci sit consectetur magnam porro. Dolorem amet amet quisquam. Voluptatem sed est est dolorem etincidunt sed non. Sed eius consectetur sit dolorem.') 
games[1].comments << Comment.new(gamer: gamers[6], description: 'Eius numquam voluptatem tempora. Labore numquam non quisquam tempora neque. Quisquam consectetur non etincidunt voluptatem sed velit quiquia. Eius eius ut dolor etincidunt sit. Magnam labore dolorem magnam. Porro sed tempora ut labore dolore. Porro eius est quiquia neque. Amet amet ut est quiquia dolorem tempora aliquam.') << Comment.new(gamer: gamers[4], description: 'Dolorem velit non aliquam ipsum. Eius ipsum velit amet voluptatem voluptatem porro tempora. Aliquam neque voluptatem sed amet aliquam dolor. Ut magnam numquam dolorem dolor. Tempora quaerat neque est tempora quaerat porro.') << Comment.new(gamer: gamers[7], description: 'Non dolore porro quisquam est. Dolorem sit dolorem magnam dolore non ipsum etincidunt. Tempora modi sed neque. Ipsum dolore ipsum porro etincidunt quaerat magnam. Dolorem ipsum labore aliquam quaerat tempora dolore dolor. Eius sit ipsum amet non aliquam.') << Comment.new(gamer: gamers[9], description: 'Sit aliquam porro quiquia. Neque modi ipsum voluptatem amet. Ut non sit dolorem quaerat dolor. Numquam adipisci quisquam eius non ut amet velit. Quisquam amet sit adipisci consectetur adipisci. Neque numquam tempora labore voluptatem adipisci neque. Tempora dolor sit etincidunt dolore velit. Ipsum porro non dolorem dolorem. Modi dolorem ipsum velit aliquam consectetur magnam sit. Dolor adipisci ipsum tempora non.') 


