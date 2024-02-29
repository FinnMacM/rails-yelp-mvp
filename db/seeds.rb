# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
names = ["Finn's cool people club", "Lourens bar 'n grill for nerds", "Chris's beach club", "Jack's narcotics bar", "Megs sushi bar"]
address = ["32 on Cool Street", "1 Nerds Drive", "72 Clifton Road", "23 Knysna Head", "21 Sushi way"]
phone_number = %w[0792888561 083611676 0821015604 0102229876 078678456]
category = %w[chinese italian japanese french belgian]

names.each_with_index do |name, index|
  Restaurant.create!(
    name: name,
    address: address[index],
    phone_number: phone_number[index],
    category: category[index]
  )
end
