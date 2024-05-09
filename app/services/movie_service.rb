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
    get_url("3/movie/top_rated&page=1")
  end

  def search_by_title(movie_title)
    get_url("3/search/movie?query=#{movie_title}&page=1")
  end

end