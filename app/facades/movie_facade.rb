class MovieFacade
  attr_reader :search_param

  def initialize(search_param)
    @search_param = search_param
  end

  def movies
    service = MovieService.new

    if @search_param == "top_rated"
        json = service.top_movies
    else
        json = service.search_by_title(@search_param)
    end

    # results from json response (used #get_url in service spec)
    movies_data = json[:results]

    # map movies_data to Movie objects
    movies_array = movies_data.map do |movie_data|
        Movie.new(movie_data)
    end

    movies_array.compact
  end

end
