require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Pulp Fiction",
      runtime: 2.5,
      genres: "Best Movie Made",
      release_date: "1994-09-10"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Pulp Fiction")
    expect(movie.runtime).to eq(2.5)
    expect(movie.genres).to eq("Best Movie Made")
    expect(movie.release_date).to eq("1994-09-10")
  end
end