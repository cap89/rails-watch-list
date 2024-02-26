require 'uri'
require 'net/http'
require 'json'

url = URI("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["Authorization"] = ENV['TMDB_API_KEY']

response = http.request(request)
result = JSON.parse(response.read_body)

if result["results"]
  result["results"].each do |movie_data|
    Movie.find_or_create_by(title: movie_data["title"]) do |movie|
      movie.overview = movie_data["overview"]
      movie.poster_url = "https://image.tmdb.org/t/p/original#{movie_data["poster_path"]}"
      movie.rating = movie_data["vote_average"]
    end
  end

  puts "Movies seeded successfully."
else
  puts "No movies found or error in fetching movies."
end
