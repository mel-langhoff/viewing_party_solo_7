class Movie
  attr_reader :title,
              :overview,
              :cast,
              :genres,
              :release_date,
              :vote_average,
              :runtime,
              :id

  def initialize(attributes)
    @title = attributes[:title]
    @description = attributes[:overview]
    @cast = attributes[:cast]
    @genres = attributes[:genres]
    @release_date = attributes[:release_date]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @formatted_runtime = format_runtime(@runtime)
  end

  # should this be private?
  def format_runtime(runtime)
    hours = runtime / 60
    minutes = runtime / 60

    "#{hours} hours and #{minutes} minutes"
  end
end