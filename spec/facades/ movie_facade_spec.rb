require 'rails_helper'

RSpec.describe MovieFacade do
  it "exists" do
    facade = MovieFacade.new("Pulp")

    expect(facade).to be_a MovieFacade
  end

  describe "#movies" do
    it "returns an array of Movie objs from the search param" do
      facade = MovieFacade.new("Pulp Fiction")

      VCR.use_cassette("movie_search_by_search_param") do
        movies = facade.movies

        expect(movies).to be_a Array
        expect(movies.first.title).to eq("Pulp Fiction")
        movies.each do |movie|
          expect(movie).to be_a Movie
        end
      end
    end

    it "returns an array of Movie objs with top 20" do
      facade = MovieFacade.new("top_rated")

      VCR.use_cassette("top_rated_movies_results") do
        movies = facade.movies

        expect(movies).to be_a Array
        movies.each do |movie|
          expect(movie).to be_a Movie
        end
      end
    end
  end

  it "#cast" do
    facade = MovieFacade.new("Pulp Fiction")
    movie_id = 123

    cast = facade.cast(movie_id)

    expect(cast).to be_an(Array)
  end

  # it "#genres" do
  #   facade = MovieFacade.new("Pulp Fiction")

  #   VCR.use_cassette("genres_list") do
  #     genres_hash = facade.genres
      
  #     expect(genres_hash).to be_a Hash
  #     expect(genres_hash).to have_value("Thriller")
  #     expect(genres_hash).to have_value("Crime")
  #   end
  # end

  it "#reviews" do
    facade = MovieFacade.new("Pulp Fiction")

    VCR.use_cassette("reviews") do
      reviews = facade.reviews(680)

      expect(reviews).to be_a Array
      reviews.each do |review|
        expect(review).to be_a Review
      end
    end
  end
end