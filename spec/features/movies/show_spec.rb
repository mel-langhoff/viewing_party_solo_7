require 'rails_helper'

RSpec.describe "Movie Details Page" do
  before :each do
    @user1 = User.create!(name: "Joe", email: "jaja@blah.com", id: 1)
    @facade = MovieFacade.new("Pulp Fiction")
  end

  # user story 3
  it 'has the title, vote average, formatted runtime, description, first 10 cast members, total review count, and each review author and info' do
    VCR.use_cassette('movie_attributes_on_details_page') do
      movie_id = @facade.movies.first.id
      visit user_movie_path(@user1, movie_id)

      expect(page).to have_content(@facade.movies.first.title)
      expect(page).to have_content(@facade.movies.first.vote_average)
      # expect(page).to have_content(@facade.movies.first.runtime)
      expect(page).to have_content(@facade.movies.first.genres)
      expect(page).to have_content(@facade.movies.first.description)
      # expect(page).to have_content(@facade.movies.first.cast)
    end
  end

  xit "has a link to create a new viewing party" do
    movie_id = @facade.movies.first.id
    visit user_movie_path(@user1, movie_id)

    expect(page).to have_link('Create a Viewing Party', href: )
  end

  xit "has a link to return to discover page" do
    movie_id = @facade.movies.first.id
    visit user_movie_path(@user1, movie_id)

    VCR.use_cassette("link_to_disc_pg") do
      expect(page).to have_link('Return to the Discover Page', href: user_discover_index_path(@user1))
    end
  end
end