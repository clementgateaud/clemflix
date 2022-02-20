require 'faker'
require "json"
require "open-uri"

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

file = URI.open('https://fr.web.img2.acsta.net/newsv7/20/03/16/12/03/3134680.jpg')
list = List.create(name: "Demo list")
list.photo.attach(io: file, filename: 'myfirstlist.png', content_type: 'image/png')

movies = JSON.parse(URI.open("https://api.themoviedb.org/3/movie/popular?api_key=62a3626345c7fcb86e890d20ca9de2a3").read)

movies["results"].first(5).each_with_index do |movie|
  title = movie["original_title"]
  overview = movie["overview"]
  poster_url = "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}"
  rating = movie["vote_average"]
  mv = Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
  Bookmark.create(list: list, movie: mv, comment:"I loved that movie")
end
