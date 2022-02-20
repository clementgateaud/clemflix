require "json"
require "open-uri"

class MoviesController < ApplicationController
  def create
    query = params[:other][:query]
    @list = List.find(params[:list_id])
    if query != ""
      movie = JSON.parse(URI.open("https://api.themoviedb.org/3/search/movie?api_key=62a3626345c7fcb86e890d20ca9de2a3&query=#{query}").read)["results"][0]
      title = movie["original_title"]
      overview = movie["overview"]
      poster_url = "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}"
      rating = movie["vote_average"]
    end
    @movie = Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
    redirect_to new_list_bookmark_path(@list)
  end
end
