# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all

user = User.new(
  id: 3,
  first_name: "Hitagi",
  last_name: "Matsmumoto",
  email: "mats@mail.com",
  password: "password",
  password_confirmation: "password"
)
user.save!

Item.create!([
  {
    name: "Iced Coffee",
    item_type: "Iced",
    price: "3.14",
    description: "Our custom blend of beans, from Colombia’s Nariño region and from East
  Africa, are grown to steep long and cold for a super-smooth flavor. Nariño
  70 Cold Brew is handcrafted in small batches daily, slow-steeped in cool
  water for 20 hours, without touching heat.",
  image: Rails.root.join("/app/assets/images/icedcoffee.jpg").open
  },
  {
    name: "Iced Coffee",
    item_type: "Iced",
    price: "3.14",
    description: "Our custom blend of beans, from Colombia’s Nariño region and from East
  Africa, are grown to steep long and cold for a super-smooth flavor. Nariño
  70 Cold Brew is handcrafted in small batches daily, slow-steeped in cool
  water for 20 hours, without touching heat.",
  image: Rails.root.join("/app/assets/image/icedcoffee.jpg").open
  },
  {
    name: "Iced Coffee",
    item_type: "Iced",
    price: "3.14",
    description: "Our custom blend of beans, from Colombia’s Nariño region and from East
  Africa, are grown to steep long and cold for a super-smooth flavor. Nariño
  70 Cold Brew is handcrafted in small batches daily, slow-steeped in cool
  water for 20 hours, without touching heat.",
  image: Rails.root.join("/app/assets/image/icedcoffee.jpg").open
  },
  {
    name: "Iced Coffee",
    item_type: "Iced",
    price: "3.14",
    description: "Our custom blend of beans, from Colombia’s Nariño region and from East
  Africa, are grown to steep long and cold for a super-smooth flavor. Nariño
  70 Cold Brew is handcrafted in small batches daily, slow-steeped in cool
  water for 20 hours, without touching heat.",
  image: Rails.root.join("/app/assets/image/icedcoffee.jpg").open
  }
])
