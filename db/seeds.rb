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

def pluralize(num, text)
  return "#{num} #{text.pluralize(num)}"
end

10.times do
  User.create(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone_number: Faker::Number.number(digits: 10),
    password: "1234"
  )
end
puts pluralize(User.all.length, "user") + " created"
# let's add some restaurants

10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::Number.number(digits: 10),
    rating: rand(1..5)
  )
end
puts pluralize(Restaurant.all.length, "Restaurant") + " created"

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

puts pluralize(Item.all.length, "Item") + " created"

User.all.each do |user|
  restaurant = Restaurant.all.sample
  items = []
  rand(1..3).times {items << restaurant.items.sample}
  Order.create(
    user: user,
    restaurant: restaurant,
    date: Faker::Date.backward(days: 14),
    status: %w(recieved out_for_delivery delivered).sample,
    items: items
  )
end
puts pluralize(Order.all.length, "order") + " created by users"


Restaurant.all.each do |restaurant|
  items = []
  rand(1..3).times {items << restaurant.items.sample}
  Order.create(
    restaurant: restaurant,
    user: User.all.sample,
    date: Faker::Date.backward(days: 14),
    status: %w(recieved out_for_delivery delivered).sample,
    items: items
  )
end
puts pluralize(Order.all.length, "order") + " created by restaurants"
