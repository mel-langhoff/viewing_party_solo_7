class MovieFacade

  def initialize(search_params)
    @search_params = search_params
  end

  def movies
    @movie_service = MovieService.new

    if @search_params == "top_rated"
      @movie_service.top_movies.take(20)
    else
      @movie_service.search_by_title(@search_params).take(20)
    end
  end

  def vote_average
    
  end
end


#   def initialize(search_param)
#     @search_param = search_param
#   end

#   def all_movies_for_discover_index
#     service = MovieService.new

#     if @search_param == "top_rated"
#       json = service.top_movies
#     end
#   end
# end

# def movies
#   service = MovieSearchService.new

#   @movies = json[:result].ma; do 

#   if @search_param == "top_rated"
#     json = service.top_rated_movies

#     @movies = json[:results].map do |movie_data|
#       Movie.new(movie_data)


#     end


#   else
#     json = service.movies_by_title(@search_param)

#     @movies = json[:results].map do |movie_data|
#       Movie.new(movie_data)
#     end
#   end

#   def movies
#     service = MovieSearchService.new

#     if @search_param == "top_rated"
#       json = service.top_rated_movies

#       @movies = json[:results].map do |movie_data|
#         Movie.new(movie_data)
#       end
#     else
#       json = service.movies_by_title(@search_param)

#       @movies = json[:results].map do |movie_data|
#         Movie.new(movie_data)
#       end
#     end
#   end
