require 'rails_helper'

describe MovieService do
  context "class methods" do
    context "#members_by_state" do
      it "returns member data" do
        search = MovieService.new.members_by_state("CO")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :runtime
        expect(movie_data[:runtime]).to be_a(String)

        expect(movie_data).to have_key :genre
        expect(movie_data[:genre]).to be_a(String)

        expect(movie_data).to have_key :release_date
        expect(movie_data[:release_date]).to be_a(String)
      end
    end
  end

  context "instance methods" do

  end
end