class MovieFacade

  def initialize(search_param)
    @search_param = search_param
  end

  def movies
    @movie_service = MovieService.new

    if @search_param == "top_rated"
      movies_data = @movie_service.top_movies
    else
      movies_data = @movie_service.search_by_title(@search_param)
    end

    movies_array = movies_data.map do |movie_data|
      Movie.new(movie_data)
    end

    movies_array.compact
  end
end
