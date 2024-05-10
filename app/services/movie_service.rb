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

  # search endpoint
  def search_by_title(movie_title)
    get_url("3/search/movie?query=#{movie_title}&include_adult=false&include_video=false&language=en-US")
  end

  # put parsing in facade?
  # def get_movie_reviews(movie_id)
  #   get_url("3/movie/#{movie_id}/reviews")

    # reviews = response[:results].map do |review_data|
    #     MovieReview.new(review_data)
    # end
  # # end

  # def full_movie_data(movie_id)
  #   reviews = get_url("3/movie/#{movie_id}/reviews")
  #   creds = get_url("3/movie/#{movie_id}/credits?language=en-US")
  #   deets = get_url("3/movie/#{movie_id}?language=en-US")

  #   all_data = deets.merge(creds).merge(reviews)
  # end

  # def get_genres
  #   response = get_url("3/genre/movie/list")

  #   response[:genres]
  # end

  def get_cast(movie_id)
    response = get_url("3/movie/#{movie_id}/credits")

    response[:cast]
  end

  def get_reviews(movie_id)
    response = get_url("3/movie/#{movie_id}/reviews")

    response[:results]
  end

  def get_deets(movie_id)
    get_url("3/movie/#{movie_id}")
  end
end