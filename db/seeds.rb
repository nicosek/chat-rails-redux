# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all..."
Message.destroy_all
User.destroy_all
Channel.destroy_all

puts "Creating Channels..."
Channel.create(name: "general")
Channel.create(name: "paris")
Channel.create(name: "react")

puts "Creating Users..."
User.create(email: "nico@gmail.com", password: "azerty")
User.create(email: "jean@yahoo.fr", password: "azerty")
User.create(email: "albert@hotmail.com", password: "azerty")

puts "Creating Messages..."
Message.create(content: "Premier message test", user: User.first, channel: Channel.first)
Message.create(content: "C'est cool", user: User.second, channel: Channel.first)
Message.create(content: "Tout à fait d'accord", user: User.third, channel: Channel.first)

Message.create(content: "Testons la chaîne Paris", user: User.first, channel: Channel.second)
Message.create(content: "Ca a l'air de marcher!", user: User.second, channel: Channel.second)
Message.create(content: "Grave!", user: User.third, channel: Channel.second)

Message.create(content: "Et maintenant la chaîne React!", user: User.first, channel: Channel.third)
Message.create(content: "Ca marche aussi!!", user: User.third, channel: Channel.third)
Message.create(content: "Waw! C'est vraiment une bête ce Nico!", user: User.second, channel: Channel.third)

puts "Done!"
