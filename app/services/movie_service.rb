class MovieService

  # sets http cxn using faraday
  def conn
    Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
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
    get_url("movie/top_rated")
  end

  # def discover_movie
  #   get_url("discover/movie")
  # end

  def search_by_title(movie_title)
    get_url("search/movie?query=#{movie_title}")
  end
end