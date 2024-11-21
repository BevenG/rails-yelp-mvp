# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# db/seeds.rb

# Clear existing data
Review.destroy_all
Restaurant.destroy_all

# Categories of restaurants
categories = %w[chinese italian japanese french belgian]

# Sample restaurants
restaurants = [
  { name: "Golden Dragon", address: "123 Main St, New York, NY", phone_number: "555-1234", category: "chinese" },
  { name: "Luigi's Trattoria", address: "456 Elm St, Boston, MA", phone_number: "555-5678", category: "italian" },
  { name: "Sushi Paradise", address: "789 Oak St, San Francisco, CA", phone_number: "555-9012", category: "japanese" },
  { name: "Le Gourmet", address: "321 Maple St, Chicago, IL", phone_number: "555-3456", category: "french" },
  { name: "Belgian Waffle House", address: "654 Pine St, Seattle, WA", phone_number: "555-7890", category: "belgian" }
]

# Create restaurants
restaurants.each do |restaurant|
  created_restaurant = Restaurant.create!(restaurant)

  # Add some reviews for each restaurant
  3.times do
    Review.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: created_restaurant
    )
  end
end

puts "Seeded #{Restaurant.count} restaurants with #{Review.count} reviews!"
