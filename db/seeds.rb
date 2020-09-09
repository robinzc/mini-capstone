# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# {name: " ", price: , image_path: , description: " "}

product = Product.create([{name: "head massager", price: 15, image_path: nil, description: "Massage your stressful day away with this spine-tingling device"}, {name: "Fender Stratocaster", price: 800, image_path: nil, description: "Live out your rock star dreams with a classic electric guitar."}, {name: "cat bed", price: 25, image_path: nil, description: "Cuddle with your furry friends in their bed now instead of watching them take over your bed!"}])