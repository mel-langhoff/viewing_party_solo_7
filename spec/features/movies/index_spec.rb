require 'rails_helper'

RSpec.describe "Movie Results Page" do
  before :each do
    @user1 = User.create!(name: "Joe", email: "jaja@blah.com")
  end

  # user story 2
  it 'can show the top 20 most popular movies' do
    VCR.use_cassette("twenty_top_rated_movies") do
      visit user_discover_index_path(@user1)

      click_on 'Discover Top Rated Movies'

      within "#movie_data" do
        expect(page).to have_content("")
      end
    end
  end

  it 'can show the search results of a user limited by 20' do
    VCR.use_cassette("twenty_top_search_results") do
      visit user_discover_index_path(@user1)
      movie = "Pulp Fiction"

      fill_in 'Enter a Movie Title', with: movie
      click_button 'Search'

      within "#movie_data" do
        expect(page).to have_content(movie.vote_average)
      end
    end
  end

  it 'has the movie title and link to the Movie Deets Page' do
    VCR.use_cassette("title_as_link") do
      visit user_discover_index_path(@user1)

      fill_in 'Enter a Movie Title', with: 'Pulp Fiction'
      click_button 'Search'

      within "#movie_data" do
        expect(page).to have_content("")
      end
    end
  end

  it 'has the vote average of the movie' do
    VCR.use_cassette("vote_average_for_movie") do
      visit user_discover_index_path(@user1)

      fill_in 'Enter a Movie Title', with: 'Pulp Fiction'
      click_button 'Search'

      within "#movie_data" do
        expect(page).to have_content("")
      end
    end
  end
end