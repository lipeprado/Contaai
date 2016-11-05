# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  Category.create(name: Faker::Book.genre)
end

user = User.create(email: "lipe@example.com", password: "123456", name: "Filipe Prado")
user = User.create(email: "bina@example.com", password: "123456", name: "Sabrina Fernandes")

30.times do
  Story.create(body: Faker::Hipster.paragraph(6), title: Faker::Book.title, user_id: rand(1..2), category_id: rand(1..9))
end
