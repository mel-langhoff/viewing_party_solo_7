require 'rails_helper'

RSpec.describe "Discover Index Page" do
  
  describe 'user story 1' do
    it 'has a button to discover top rated movies' do
      visit user_movies_path(@user)

      expect(page).to have_button('Discover Top Rated Movies', href: user_movies_path(@user))
    end

    it 'has a form to search by movie title'
    visit user_movies_path(@user)

    expect(page).to have_field('Enter a Movie Title')
  end

  it 'has a button to submit a search' do
    visit user_movies_path(@user)

    expect(page).to have_button('Search', href: user_movies_path(@user))
  end
end