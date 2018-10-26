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
	{steam_id: 10, name: 'Counter-Strike', price: 9.99, release_date: 'Nov 1, 2000', description: 'Non quaerat dolor sed quiquia voluptatem magnam. Eius sit eius labore modi. Aliquam quiquia labore neque non. Ipsum sit amet porro consectetur dolor labore eius. Est dolorem eius labore tempora quaerat magnam porro.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/10/header.jpg?t=1528733245', genre_ids: [genres[15].id, genres[21].id, genres[19].id, ], company_ids: [companies[23].id, companies[3].id, companies[5].id, companies[22].id, companies[6].id, ]},
	{steam_id: 20, name: 'Team Fortress Classic', price: 4.99, release_date: 'Apr 1, 1999', description: 'Velit quisquam dolore aliquam. Sit porro amet aliquam magnam dolor quaerat dolore. Sit quisquam dolore aliquam adipisci etincidunt. Sit est dolore modi. Est dolorem adipisci amet adipisci etincidunt est velit. Eius aliquam voluptatem adipisci magnam velit.', image: 'https://steamcdn-a.akamaihd.net/steam/apps/20/header.jpg?t=1528732825', genre_ids: [genres[2].id, genres[16].id, genres[17].id, ], company_ids: [companies[16].id, companies[15].id, companies[6].id, ]},
])

games[0].game_ratings << GameRating.new(gamer: gamers[7], rating: 1) << GameRating.new(gamer: gamers[4], rating: 1) << GameRating.new(gamer: gamers[2], rating: 4) << GameRating.new(gamer: gamers[8], rating: 2) << GameRating.new(gamer: gamers[1], rating: 5) 
games[1].game_ratings << GameRating.new(gamer: gamers[9], rating: 3) << GameRating.new(gamer: gamers[3], rating: 2) 


games[0].comments << Comment.new(gamer: gamers[7], description: 'Porro ipsum consectetur ut tempora. Consectetur ipsum labore tempora numquam labore. Sed est velit sed. Quisquam velit aliquam porro neque dolorem porro porro. Ipsum ipsum aliquam modi est dolor adipisci.') << Comment.new(gamer: gamers[8], description: 'Quisquam aliquam non dolore neque porro dolorem consectetur. Est ut est amet aliquam consectetur. Dolore consectetur aliquam magnam quiquia porro. Neque amet labore modi. Numquam sed dolor eius adipisci labore. Modi est porro sed labore sit.') << Comment.new(gamer: gamers[5], description: 'Dolor dolor ut dolorem magnam ipsum numquam. Adipisci porro porro amet non. Consectetur quiquia porro quaerat quiquia non velit sed. Voluptatem magnam quiquia ut voluptatem dolorem adipisci. Est adipisci non quisquam labore. Tempora dolor neque dolor numquam ipsum. Modi eius quiquia neque sed eius aliquam eius. Sit porro sed dolore ipsum neque sed modi. Velit voluptatem ipsum tempora etincidunt neque sit consectetur. Adipisci consectetur amet aliquam voluptatem ut.') 
games[1].comments << Comment.new(gamer: gamers[9], description: 'Quisquam voluptatem velit eius ipsum labore. Quaerat magnam dolorem dolor. Quiquia eius quaerat velit quaerat quaerat amet. Ipsum aliquam consectetur numquam quaerat modi. Ut numquam neque neque quaerat etincidunt dolorem. Neque ut sit labore dolore magnam adipisci.') << Comment.new(gamer: gamers[8], description: 'Magnam modi quiquia quaerat quiquia. Tempora eius etincidunt magnam porro labore amet. Sit labore non porro modi. Magnam magnam labore ut. Quaerat ipsum tempora dolor numquam. Magnam dolorem quiquia ut neque porro. Non eius porro porro ut. Quiquia dolore dolorem ipsum. Labore velit etincidunt ipsum. Etincidunt consectetur magnam tempora neque dolor amet numquam.') << Comment.new(gamer: gamers[10], description: 'Amet aliquam velit aliquam numquam. Ipsum voluptatem amet consectetur dolorem etincidunt dolorem voluptatem. Consectetur eius quiquia sed consectetur neque numquam amet. Dolorem est neque sed. Ipsum quiquia etincidunt dolore sed neque neque sit. Ipsum quiquia etincidunt magnam voluptatem amet consectetur etincidunt. Quaerat aliquam eius ipsum etincidunt velit sed adipisci. Voluptatem quiquia etincidunt modi. Magnam ut tempora consectetur numquam voluptatem ipsum neque.') << Comment.new(gamer: gamers[3], description: 'Dolorem quaerat quiquia amet dolor eius tempora. Tempora quaerat non quaerat. Ut neque tempora etincidunt adipisci tempora porro ipsum. Est quiquia sed ut labore non voluptatem quaerat. Neque tempora quaerat aliquam non velit. Porro dolore tempora dolorem sed quisquam. Eius consectetur ut porro sed tempora non quiquia. Magnam non consectetur numquam labore dolor.') << Comment.new(gamer: gamers[2], description: 'Ipsum labore amet sit ipsum dolor dolore aliquam. Ipsum dolorem dolore adipisci. Modi eius aliquam labore dolor. Eius sit modi dolore. Non dolorem est quaerat. Dolorem non tempora tempora voluptatem neque ipsum sed. Quaerat velit dolor sed sit.') << Comment.new(gamer: gamers[7], description: 'Consectetur magnam quaerat non magnam est consectetur amet. Labore modi aliquam tempora etincidunt velit. Consectetur ut ut dolore modi ut labore. Aliquam sit consectetur ut. Ut quiquia numquam sit etincidunt. Dolorem aliquam ipsum porro labore dolor dolorem velit. Quiquia dolorem tempora sit adipisci amet consectetur dolor.') 


