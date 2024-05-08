require 'rails_helper'

describe MovieService do

  it "#conn" do
    service = MovieService.new
    connection = service.conn

    expect(connection).to be_an_instance_of Faraday::Connection
    expect(connection.params["api_key"]).to eq(Rails.application.credentials.the_movie_db[:api_key])
  end

  # use VCR, use #top_rated cassette
  it "#get_url" do
    service = MovieService.new

    VCR.use_cassette("top_rated_movies") do
      url = "movie/top_rated"
      parsed_json = service.get_url(url)

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array
    end
  end


  describe "#search_by_title" do
    xit "returns a movie by its title" do
      search = MovieService.new.search_by_title("Pulp Fiction")

      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      movie_data = search[:results].first

      expect(movie_data).to have_key :title
      expect(movie_data[:title]).to be_a(String)

      expect(movie_data).to have_key :runtime
      expect(movie_data[:runtime]).to be_a(Integer)

      # expect(movie_data).to have_key :genres
      # expect(movie_data[:genres]).to be_a(String)

      expect(movie_data).to have_key :release_date
      expect(movie_data[:release_date]).to be_a(String)
    end

    xit "returns an array of Movie objects" do
      facade = MovieService.new("Pulp")

      expect(facade.search_by_title).to be_a Array
      facade.search_by_title.each do |movie|
        expect(movie).to be_a Movie
      end
    end
  end
end