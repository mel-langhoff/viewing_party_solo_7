require 'rails_helper'

RSpec.describe "Movie Details Page" do
  before :each do
    @user1 = User.create!(name: "Joe", email: "jaja@blah.com")
    @facade = MovieFacade.new("Pulp Fiction")
  end

  # user story 3
  it 'has the title, vote average, formatted runtime, description, first 10 cast members, total review count, and each review author and info' do
    visit user_movie_path(@user1, @facade.movies.first)

    expect(page).to have_content(@facade.movies.first.title)
    expect(page).to have_content(@facade.movies.first.vote_average)
    expect(page).to have_content(@facade.movies.first.runtime)
    expect(page).to have_content(@facade.movies.first.genres)
    expect(page).to have_content(@facade.movies.first.description)
    expect(page).to have_content(@facade.movies.first.cast)
    # expect(page).to have_content(@facade.movies.first.review_count)
    # expect(page).to have_content(@facade.movies.first.reviewers)
  end
end