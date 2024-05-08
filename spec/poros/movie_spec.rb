require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Pulp Fiction",
      runtime: "2.5",
      genre: "Best Movie Made",
      release_date: "1/1/1993"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Pulp Fiction")
    expect(movie.runtime).to eq("2.5")
    expect(movie.genre).to eq("Best Movie Made")
    expect(movie.release_date).to eq("1/1/1993")
  end
end