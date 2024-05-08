class Movie
  attr_reader :title

  def initialize(attributes)
    @title = attributes[:title]
    @runtime = attributes[:runtime]
    @genre = attributes[:genre]
    @release_date = attributes[:release_date]
  end
end