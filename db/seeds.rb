# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
games = Game.create([{steam_id: 730, name: 'Counter-Strike: Global Offensive', price: 14.99, release_date: '2012-08-21', description: 'Counte', image: 'https://steamcdn-a.akamaihd.net/steam/apps/730/header.jpg?t=1539299939' }, { steam_id: 1, name: "test", price: 4.20, release_date: '2000-01-01', description: 'empty', image: 'https://steamcdn-a.akamaihd.net/steam/apps/240/header.jpg?t=1515613564' }])






Background.create(name: "Camo", price: 7, url: "", steam_id: 730)