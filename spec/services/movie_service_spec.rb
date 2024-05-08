require 'rails_helper'

describe MovieService do

  context "class methods" do

    context "#search_by_title" do
      it "returns a movie by its title" do
        search = MovieService.new.search_by_title("Pulp")

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

      it "returns an array of Movie objects" do
        facade = MovieSearchFacade.new("Pulp")

        expect(facade.search_by_title).to be_a Array
        facade.search_by_title.each do |movie|
          expect(movie).to be_a Movie
        end
      end
    end
  end

  context "instance methods" do

  end
end