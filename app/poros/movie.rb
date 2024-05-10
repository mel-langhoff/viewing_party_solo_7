class Movie
  attr_reader :title,
              :overview,
              :cast,
              :release_date,
              :vote_average,
              :runtime,
              :id,
              :genres,
              :description

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:overview]
    @cast = attributes[:cast]
    @genres = attributes[:genres]
    @release_date = attributes[:release_date]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime].to_f
    # @formatted_genres = format_genres(@genres)
  end

  # should this be private?
  def format_runtime(runtime)
    hours = runtime.floor / 60
    minutes = (runtime % 60).round.to_i

    "#{hours}h and #{minutes}m"
  end

  def format_genres(genres)
    genres.map { |genre| genre[:name] }.join(", ")
  end
end