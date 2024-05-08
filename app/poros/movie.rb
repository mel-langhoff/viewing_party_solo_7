class Movie
  attr_reader :title

  def initialize(attributes)
    @title = attributes[:title]
    @description = attributes[:overview]
    @cast = attributes[:cast]
    @runtime = attributes[:runtime]
    # @genres = attributes[:genres]
    @release_date = attributes[:release_date]
  end
end