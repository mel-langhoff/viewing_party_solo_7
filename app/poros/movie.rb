class Movie
  attr_reader :title,
              :overview,
              :cast,
              :genres,
              :release_date,
              :vote_average,
              :runtime

  def initialize(attributes)
    # require 'pry'; binding.pry
    @title = attributes[:title]
    @description = attributes[:overview]
    @cast = attributes[:cast]
    @genres = attributes[:genres]
    @release_date = attributes[:release_date]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
  end
end