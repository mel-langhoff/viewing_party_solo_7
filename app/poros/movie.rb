class Movie
  attr_reader :title,
              :id,
              :overview,
              :cast,
              :runtime,
              :genres,
              :release_date,
              :vote_average,
              :runtime

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:overview]
    @cast = attributes[:cast]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @release_date = attributes[:release_date]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
  end
end