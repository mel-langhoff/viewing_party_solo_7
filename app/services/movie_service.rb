class MovieService

  # sets http cxn using faraday
  def conn
    Faraday.new(url: "https://api.themoviedb.org/") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.the_movie_db[:api_key]
    end
  end

  # making an http get request to a url argu and parsing the response
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # endpoint for top movies
  def top_movies
    get_url("3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200")
  end

  def search_by_title(movie_title)
    get_url("3/search/movie?query=#{movie_title}&include_adult=false&include_video=false&language=en-US")
  end

end