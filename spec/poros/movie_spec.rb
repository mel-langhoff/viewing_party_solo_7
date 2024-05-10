require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Pulp Fiction",
      runtime: "2.5",
      release_date: "1994-09-10"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Pulp Fiction")
    expect(movie.runtime).to eq(2.5)
    expect(movie.release_date).to eq("1994-09-10")
  end

  it "#format_runtime" do
    movie = Movie.new(runtime: 90)
    formatted_runtime = movie.format_runtime(movie.runtime)

    expect(formatted_runtime).to eq("1h and 30m")
  end

  it "#format_genres" do
    genres = [{ id: 1, name: "Action" }, { id: 2, name: "Comedy" }]
    movie = Movie.new(genres: genres)
    
    formatted_genres = movie.format_genres(movie.genres)

    expect(formatted_genres).to eq("Action, Comedy")
  end
end