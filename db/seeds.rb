# let's add some users

OrderItem.destroy_all
puts "destroyed order_items"
Order.destroy_all
puts "destoyed orders"
Item.destroy_all
puts "items destroyed"
User.destroy_all
puts "users destroyed"
Restaurant.destroy_all
puts "restaurants destroyed"


10.times do
  User.create(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone_number: Faker::Number.number(digits: 10),
  )
end
puts "users created"
# let's add some restaurants

10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::Number.number(digits: 10),
    rating: rand(1..5)
  )
end
puts "restaurants created"

# let's make some menus

Restaurant.all.each do |restaurant|
  rand(20..30).times do
    Item.create(
      restaurant: restaurant,
      name: Faker::Food.dish,
      description: Faker::Food.description,
      price: rand(8..50)
    )
  end
end

puts "menus created"

User.all.each do |user|
  Order.create(
    user: user,
    restaurant: Restaurant.all.sample,
    date: Faker::Date.backward(days: 14),
    status: %w(recieved out_for_delivery delivered).sample
  )
end
puts "user orders created"
Restaurant.all.each do |restaurant|
  Order.create(
    restaurant: restaurant,
    user: User.all.sample,
    date: Faker::Date.backward(days: 14),
    status: %w(recieved out_for_delivery delivered).sample
  )
end
puts "restaurant orders created"

Order.all.each do |order|
  rand(1..3).times do
    OrderItem.create(
      order: order,
      item: order.restaurant.items.sample
    )
  end
end

puts "items added to orders"