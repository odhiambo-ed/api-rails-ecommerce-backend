# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Custommers
c1 = Customer.create!(first_name: "Edward", second_name: "Odhiambo")

#Products
p1 = Product.create!(name: "Playstation", image: "https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent condimentum sed urna quis hendrerit. Integer tincidunt velit nec odio ultricies, at finibus neque porta.", category: "Games", original_price: 400, selling_price: 300, rating: 5, in_stock: true)

#