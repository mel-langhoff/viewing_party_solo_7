require 'rails_helper'

RSpec.describe "Discover Index Page" do
  before :each do
    @user1 = User.create!(name: "Joe", email: "blah@jaja.com")
  end
  
  # user story 1
  it 'has a button to discover top rated movies' do
    visit user_discover_index_path(@user1)

    expect(page).to have_link('Discover Top Rated Movies')
  end

  it 'has a form to search by movie title' do
    visit user_discover_index_path(@user1)

    expect(page).to have_field('Enter a Movie Title')
  end

  it 'has a button to submit a search' do
    visit user_discover_index_path(@user1)

    within "#search_by_title" do
      expect(page).to have_button('Search')
    end
  end

  # user story 2
  it 'has a button that will redirect to the movies results page with the top 20 movies' do
    VCR.use_cassette("top_rated_movies") do      
      visit user_discover_index_path(@user1)

      click_on 'Discover Top Rated Movies'

      expect(current_path).to eq(user_movies_path(@user1))
    end
  end

  it 'has a button that will redirect to the movies results page with the search results' do
    VCR.use_cassette("search_pulp_fiction") do
      visit user_discover_index_path(@user1)

      fill_in 'Enter a Movie Title', with: 'Pulp Fiction'
      click_button 'Search'
      
      expect(current_path).to eq(user_movies_path(@user1))
      expect(page).to have_content("Pulp Fiction")
    end
  end
end