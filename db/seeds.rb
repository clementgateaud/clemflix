# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "json"
require "open-uri"

Bookmark.destroy_all
Movie.destroy_all
# List.destroy_all

# List.create(name: "Action")
# List.create(name: "Comedy")
# List.create(name: "Cartoon")
# List.create(name: "Adventure")
# List.create(name: "Romance")


movies = JSON.parse(URI.open("https://api.themoviedb.org/3/movie/popular?api_key=62a3626345c7fcb86e890d20ca9de2a3").read)

movies["results"].each_with_index do |movie|
  title = movie["original_title"]
  overview = movie["overview"]
  poster_url = "https://image.tmdb.org/t/p/original#{movie["poster_path"]}"
  rating = movie["vote_average"]
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end


# 100.times do
#   Bookmark.create(list: List.all.sample, movie: Movie.all.sample, comment:Faker::Lorem.sentence)
# end
