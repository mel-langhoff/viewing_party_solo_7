class MovieFacade
  attr_reader :search_param

  def initialize(search_param)
    @search_param = search_param
  end

  # put json in service?
  def movies
    service = MovieService.new

    if @search_param == "top_rated"
      json = service.top_movies
    else
      json = service.search_by_title(@search_param)
    end

    # results from json response (used #get_url in service spec)
    movies_data = json[:results]

    # map movies_data to Movie objs
    movies_array = movies_data.map do |movie_data|
      Movie.new(movie_data)
    end

    # .compact gets rid of nils
    movies_array.compact
  end

  def movie(movie_id)
    service = MovieService.new
    movie_data = service.get_deets(movie_id)

    Movie.new(movie_data)
  end
  # def reviews(movie_id)
  #   service = MovieService.new
  #   json = service.get_movie_reviews(movie_id)

  #   json[:results].map do |review|
  #     MovieReview.new(review)
  #   end
  # end

  # def movie(movie_id)
  #   service = MovieService.new
  #   movies_data_json = service.full_movie_data(movie_id)

  #   Movie.new(movies_data_json)
  # end

  # def genres
  #   service = MovieService.new
  #   genres_data = service.get_genres
  #   genres_hash = {}

  #   genres_data[:genres].each do |genre|
  #     genres_hash[genre[:id]] = genre[:name]
  #   end
  #   genres_hash
  # end

  def cast(movie_id)
    service = MovieService.new
    cast_data = service.get_cast(movie_id)

    cast_data.map do |cast_member_data|
      CastMember.new(cast_member_data)
    end
  end

  def reviews(movie_id)
    service = MovieService.new
    reviews_data = service.get_reviews(movie_id)

    reviews_data.map do |review_data|
      Review.new(review_data)
    end
  end
end
