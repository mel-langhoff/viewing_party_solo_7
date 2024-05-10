require 'rails_helper'

RSpec.describe "Movie Results Page" do
  before :each do
    @user1 = User.create!(name: "Joe", email: "jaja@blah.com")
    @facade = MovieFacade.new("Pulp Fiction")
  end

  # user story 2
  xit 'can show the top 20 most popular movies' do
    VCR.use_cassette("twenty_top_rated_movies") do
      visit user_discover_index_path(@user1)

      click_on 'Discover Top Rated Movies'

      within "#movies_data" do
        expect(page).to_not have_content("21")
      end
    end
  end

  # count something somehow, like elements??
  xit 'can show the search results of a user limited by 20' do
    VCR.use_cassette("twenty_top_search_results") do
      visit user_discover_index_path(@user1)

      fill_in 'Enter a Movie Title', with: "Pulp"
      click_button 'Search'

      within "#movies_data" do
        expect(page).to have_content("Pulp Fiction")
      end
    end
  end

  # make a movie obj or something
  xit 'has the movie title and link to the Movie Deets Page' do
    VCR.use_cassette("title_as_link") do
      visit user_discover_index_path(@user1)

      fill_in 'Enter a Movie Title', with: "Pulp Fiction"
      click_button 'Search'


        expect(page).to have_link('Pulp Fiction', href: user_movie_path(@user1, @facade.movies.first))

    end
  end

  it 'has the vote average of the movie' do
    VCR.use_cassette("vote_average_for_movie") do
      visit user_discover_index_path(@user1)

      fill_in 'Enter a Movie Title', with: 'Pulp Fiction'
      click_button 'Search'

      within "#movies_data" do
        expect(page).to have_content(@facade.movies.first.vote_average)
      end
    end
  end
end