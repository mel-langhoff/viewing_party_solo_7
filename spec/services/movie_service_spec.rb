require 'rails_helper'

describe MovieService do

  it "#conn" do
    service = MovieService.new
    connection = service.conn

    expect(connection).to be_an_instance_of Faraday::Connection
    expect(connection.params["api_key"]).to eq(Rails.application.credentials.the_movie_db[:api_key])
  end

  # Use VCR, use the 'top_rated_movies' cassette
  it "#get_url" do
    service = MovieService.new

    VCR.use_cassette("top_rated_movies") do
      url = "3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200"
      parsed_json = service.get_url(url)

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array
    end
  end

  describe "#search_by_title" do
    it "returns a movie by its title" do
      VCR.use_cassette("search_by_title") do
        search = MovieService.new.search_by_title("Pulp Fiction")

        expect(search).to be_a Hash
        expect(search[:results]).to be_a Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a String

        # expect(movie_data).to have_key :runtime
        # expect(movie_data[:runtime]).to be a Integer

        # expect(movie_data).to have_key :genres
        # expect(movie_data[:genres]).to be a String

        # expect(movie_data).to have_key :release_date
        # expect(movie_data[:release_date]).to be a String
      end
    end

    it "returns an array of Movie objects" do
      VCR.use_cassette("array_of_movie_objs") do
        service = MovieService.new

        search_result = service.search_by_title("Pul")
        expect(search_result[:results]).to be_a Array

        search_result[:results].each do |movie_data|
          expect(movie_data).to be_a Hash
        end
      end
    end
  end
end
