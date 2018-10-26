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
	{steam_id: 10, name: 'Counter-Strike', price: 9.99, release_date: 'Nov 1, 2000', description: 'Non est ut dolorem adipisci. Tempora ipsum porro ut est consectetur ut dolor. Non tempora consectetur aliquam labore. Dolorem aliquam dolorem velit quisquam eius. Aliquam adipisci quaerat non tempora aliquam tempora. Quiquia quiquia quiquia dolorem. Sit neque quiquia est.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/10/header.jpg?t=1528733245', genre_ids: [genres[8].id, ], company_ids: [companies[18].id, companies[2].id, companies[14].id, companies[21].id, companies[10].id, ], gamer_ids: [gamers[0].id, gamers[1].id, gamers[3].id, gamers[2].id, gamers[6].id, gamers[7].id, ]},
	{steam_id: 20, name: 'Team Fortress Classic', price: 4.99, release_date: 'Apr 1, 1999', description: 'Ipsum sit amet dolore. Sit adipisci quaerat quisquam. Neque eius ut modi modi dolorem porro quisquam. Etincidunt non consectetur dolore ut quaerat. Quisquam ut porro eius. Aliquam dolor magnam neque est non.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/20/header.jpg?t=1528732825', genre_ids: [genres[21].id, genres[1].id, genres[23].id, genres[12].id, genres[11].id, genres[18].id, ], company_ids: [companies[14].id, companies[23].id, companies[12].id, ], gamer_ids: [gamers[0].id, gamers[6].id, gamers[3].id, gamers[7].id, gamers[8].id, gamers[1].id, gamers[2].id, ]},
])

games[0].game_ratings << GameRating.new(gamer: gamers[4], rating: 5) << GameRating.new(gamer: gamers[1], rating: 3) << GameRating.new(gamer: gamers[9], rating: 3) << GameRating.new(gamer: gamers[10], rating: 1) << GameRating.new(gamer: gamers[6], rating: 4) << GameRating.new(gamer: gamers[2], rating: 2) << GameRating.new(gamer: gamers[3], rating: 6) << GameRating.new(gamer: gamers[5], rating: 5) 
games[1].game_ratings << GameRating.new(gamer: gamers[6], rating: 3) << GameRating.new(gamer: gamers[5], rating: 5) << GameRating.new(gamer: gamers[9], rating: 2) << GameRating.new(gamer: gamers[7], rating: 4) << GameRating.new(gamer: gamers[10], rating: 3) << GameRating.new(gamer: gamers[8], rating: 5) << GameRating.new(gamer: gamers[1], rating: 4) << GameRating.new(gamer: gamers[2], rating: 4) << GameRating.new(gamer: gamers[4], rating: 1) 


games[0].comments << Comment.new(gamer: gamers[7], description: 'Etincidunt ipsum quiquia aliquam dolore. Dolor aliquam consectetur aliquam neque est. Amet adipisci quisquam consectetur quisquam dolorem sed quisquam. Eius adipisci sed quaerat. Aliquam consectetur quisquam quaerat. Neque ut numquam adipisci. Voluptatem consectetur ipsum est quisquam. Neque dolore sit ut neque ut velit. Dolor etincidunt etincidunt est labore velit quaerat aliquam. Amet quiquia quaerat neque ipsum magnam porro.') << Comment.new(gamer: gamers[2], description: 'Est eius voluptatem eius est sed consectetur consectetur. Eius etincidunt ipsum dolor ipsum etincidunt labore sed. Amet dolor sit amet sit aliquam consectetur quiquia. Aliquam voluptatem quiquia numquam ut amet dolore est. Magnam non dolorem aliquam. Tempora adipisci neque dolor est velit ipsum.') << Comment.new(gamer: gamers[3], description: 'Sed porro aliquam voluptatem dolor. Eius neque eius tempora amet. Dolore dolore numquam quaerat voluptatem. Sed sed labore eius. Quisquam sed amet dolore voluptatem dolore ipsum quiquia.') << Comment.new(gamer: gamers[1], description: 'Sit dolorem aliquam porro etincidunt tempora. Porro amet adipisci porro amet. Numquam consectetur amet numquam quiquia quisquam ut aliquam. Sit adipisci dolorem modi est. Etincidunt magnam quisquam quisquam voluptatem dolor consectetur voluptatem. Quisquam dolor magnam numquam. Modi sed neque voluptatem consectetur sed quisquam. Ut quaerat neque voluptatem dolorem quiquia porro consectetur. Quiquia sit dolor tempora voluptatem. Ipsum modi tempora est quiquia tempora quiquia eius.') << Comment.new(gamer: gamers[9], description: 'Velit est voluptatem adipisci sit adipisci sed dolorem. Est ut modi dolorem dolore aliquam. Neque dolorem dolore consectetur. Velit numquam dolor velit sit adipisci quisquam ut. Eius etincidunt modi quiquia. Eius sed adipisci numquam. Ipsum etincidunt modi eius dolore neque eius tempora. Etincidunt velit numquam eius amet magnam. Aliquam amet dolore velit aliquam.') << Comment.new(gamer: gamers[8], description: 'Non consectetur eius neque consectetur. Tempora tempora quisquam dolor labore quiquia. Tempora quisquam neque amet dolorem ipsum est quiquia. Sit etincidunt etincidunt ipsum magnam adipisci tempora modi. Velit ipsum labore neque consectetur voluptatem. Ipsum eius dolorem neque est dolore consectetur. Quiquia numquam tempora modi amet modi. Amet aliquam sed labore magnam quaerat magnam. Porro consectetur etincidunt voluptatem modi voluptatem. Ut quiquia est voluptatem dolor.') << Comment.new(gamer: gamers[6], description: 'Voluptatem dolor numquam magnam. Dolorem quisquam labore est quiquia. Tempora quisquam consectetur aliquam. Numquam velit dolorem quiquia magnam velit. Ipsum adipisci est neque. Ipsum labore voluptatem labore amet voluptatem tempora labore. Tempora numquam modi velit quiquia dolor magnam. Magnam ipsum consectetur velit. Ipsum non labore sit dolor quaerat consectetur.') << Comment.new(gamer: gamers[4], description: 'Dolor etincidunt dolorem ipsum aliquam dolore. Sit modi sit quisquam sit. Ipsum porro etincidunt porro velit. Dolor ut modi magnam aliquam etincidunt. Quisquam dolor quaerat non. Modi eius etincidunt ipsum sit. Ipsum voluptatem sit eius etincidunt dolor. Ut quaerat ut velit. Adipisci dolorem eius porro.') << Comment.new(gamer: gamers[5], description: 'Porro non tempora magnam voluptatem consectetur etincidunt consectetur. Sed ut neque est adipisci sit sit. Adipisci numquam sed numquam tempora quisquam. Est adipisci ipsum dolorem magnam. Neque dolorem dolor ipsum dolorem amet amet. Aliquam voluptatem adipisci labore aliquam etincidunt velit. Quiquia velit voluptatem dolorem. Neque dolore eius labore consectetur neque. Neque dolore velit velit non dolore quaerat dolor.') 
games[1].comments << Comment.new(gamer: gamers[5], description: 'Porro velit voluptatem labore numquam velit dolore aliquam. Voluptatem numquam etincidunt adipisci sit numquam sed magnam. Dolore sed voluptatem dolor est numquam numquam magnam. Non sed labore voluptatem. Ipsum non porro voluptatem eius. Sit non sit numquam. Eius voluptatem tempora neque sed. Voluptatem consectetur magnam ut velit.') << Comment.new(gamer: gamers[6], description: 'Eius voluptatem neque quisquam numquam modi quaerat. Porro modi sed quaerat adipisci quisquam dolor. Dolorem amet ut velit amet. Neque numquam ut labore dolorem porro. Modi quaerat aliquam etincidunt porro. Ipsum sed modi sit amet neque dolore. Non est sed quisquam non labore sed. Numquam quaerat non sit dolore etincidunt labore.') << Comment.new(gamer: gamers[2], description: 'Amet ut non ut modi ut aliquam neque. Sed dolor etincidunt dolorem modi. Ipsum magnam dolore etincidunt dolorem numquam etincidunt sed. Dolorem ut dolore voluptatem dolorem adipisci ipsum quaerat. Non tempora est sed. Dolor quiquia amet numquam. Dolore quisquam dolorem labore consectetur. Numquam dolorem dolore est est sed modi. Eius quaerat non voluptatem sit quaerat magnam eius.') << Comment.new(gamer: gamers[7], description: 'Magnam dolor dolor porro. Ut aliquam quisquam neque porro quiquia dolor etincidunt. Ipsum labore dolor labore non porro. Sed consectetur sed amet sit. Est non amet dolor aliquam. Velit ipsum neque adipisci eius consectetur neque. Aliquam voluptatem tempora eius. Tempora sit dolore velit consectetur dolor tempora. Quaerat sed magnam consectetur numquam.') 


requests = Request.create([
	{steam_id: 958000, status: 'pending', gamer_id: 2},
	{steam_id: 958010, status: 'pending', gamer_id: 3},
	{steam_id: 958030, status: 'pending', gamer_id: 4},
	{steam_id: 958060, status: 'pending', gamer_id: 5},
	{steam_id: 958240, status: 'pending', gamer_id: 6},
	{steam_id: 958300, status: 'pending', gamer_id: 7},
	{steam_id: 958310, status: 'pending', gamer_id: 8},
	{steam_id: 958420, status: 'pending', gamer_id: 9},
	{steam_id: 958430, status: 'pending', gamer_id: 10},
	{steam_id: 958790, status: 'pending', gamer_id: 11},
])

