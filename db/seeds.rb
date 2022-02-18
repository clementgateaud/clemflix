# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

# List.create(name: "Action")
# List.create(name: "Comedy")
# List.create(name: "Cartoon")
# List.create(name: "Adventure")
# List.create(name: "Romance")

100.times do
  Movie.create(title: Faker::Movie.title, overview: Faker::Lorem.paragraph(sentence_count: 10), poster_url: "https://picsum.photos/500/300", rating: rand(5.0..10.0).round(1))
end

# 100.times do
#   Bookmark.create(list: List.all.sample, movie: Movie.all.sample, comment:Faker::Lorem.sentence)
# end

#/movie/popular
