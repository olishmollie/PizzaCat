# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = [
  ["Milto's Austin", "http://miltosmediterraneancafe.com/"], 
  ["Frank & Angie's", "www.hutsfrankandangies.com/"],
  ["Conan's Pizza", "http://www.conanspizza.com/"],
  ["Roppolo's Pizzeria", "http://www.roppolos.com/"],
  ["Via 313", "http://www.via313.com/"],
  ["Bufalina", "http://www.bufalinapizza.com"],
  ["Brick Oven", "http://www.brickovenaustin.com"],
  ["Home Slice Pizza", "http://www.homeslicepizza.com"],
  ["Pinthouse Pizza", "http://www.pinthousepizza.com"],
  ["Pieous", "http://www.facebook.com/Pieous"],
  ["Unit-D Pizzeria", "http://www.unitdpizzeria.com/"],
  ["The Backspace", "http://www.thebackspace-austin.com/"],
  ["The ABGB", "http://www.theabgb.com/"],
  ["East Side Pies", "http://www.eastsidepies.com"],
  ["The Parlor", "http://www.theparloraustin.com"],
  ["Southside Flying Pizza", "http://www.southsideflyingpizza.com"],
  ["Stanley's Farmhouse Pizza", "http://www.stanleysfarmhousepizza.com/"]
]

restaurants.each do |restaurant|
  r = Restaurant.new
  r.name = restaurant[0]
  r.webpage = restaurant[1]
  r.city = "Austin"
  r.state = "Texas"
  r.save
end