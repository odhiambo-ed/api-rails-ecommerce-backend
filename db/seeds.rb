# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Custommers
# c1 = Customer.create!(first_name: "Edward", second_name: "Odhiambo")

# #Products
# p1 = Product.create!(name: "Playstation", image: "https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent condimentum sed urna quis hendrerit. Integer tincidunt velit nec odio ultricies, at finibus neque porta.", category: "Games", original_price: 400, selling_price: 300, rating: 5, in_stock: true)

# #
require 'faker'

# Seed categories
10.times do
  category = Category.create(
    name: Faker::Commerce.department(max: 1),
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )
  
  # Seed products
  10.times do
    product = category.products.create(
      name: Faker::Commerce.product_name,
      image: Faker::LoremFlickr.image(size: "300x300", search_terms: [category.name]),
      description: Faker::Lorem.paragraph(sentence_count: 5),
      original_price: Faker::Number.between(from: 500, to: 5000),
      selling_price: Faker::Number.between(from: 200, to: 4000),
      rating: Faker::Number.between(from: 1, to: 5),
      in_stock: Faker::Boolean.boolean(true_ratio: 0.9),
      in_wishlist: Faker::Boolean.boolean(true_ratio: 0.2),
      recommended: Faker::Boolean.boolean(true_ratio: 0.3)
    )

    # Seed colors
    3.times do
      product.colors.create(name: Faker::Color.color_name)
    end

    # Seed sizes
    4.times do
      product.sizes.create(
        name: Faker::Commerce.material,
        description: Faker::Lorem.sentence(word_count: 3)
      )
    end

    # Seed images
    3.times do
      product.images.create(
        name: Faker::Lorem.word,
        url: Faker::LoremFlickr.image(size: "300x300", search_terms: [product.name])
      )
    end
  end
end

# Seed customers
10.times do
  customer = Customer.create(
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )

  # Seed customers_products
  5.times do
    product = Product.all.sample
    customer.products << product
  end
end


