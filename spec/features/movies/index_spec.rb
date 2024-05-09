# test for in US 2: 
# test for top 20 popular movies somehow
# test for search results to appear

require 'rails_helper'

RSpec.describe "Movie Results Page" do
  before :each do
    @user = User.create!(name: "Joe", email: "jaja@blah.com")
    @facade = MovieFacade.create!(search_param: "Pulp Fiction")
    @service = MovieService.create!
  end

  # user story 2
  it 'can show the top 20 most popular movies' do
    VCR.use_cassette("twenty_top_rated_movies") do

    end
  end

  it 'can show the search results of a user limited by 20' do
    VCR.use_cassette("twenty_top_search_results") do

    end
  end

  it 'has the movie title and link to the Movie Deets Page' do
    VCR.use_cassette("title_as_link") do

    end
  end

  it 'has the vote average of the movie' do
    VCR.use_cassette("vote_average_for_movie") do

    end
  end
end