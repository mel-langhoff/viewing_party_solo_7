require 'rails_helper'

RSpec.describe MovieSearchFacade do
  it "exists" do
    facade = MovieSearchFacade.new("Pulp")

    expect(facade).to be_a MovieSearchFacade
  end

  it "#search_by_title" do
    facade = MovieSearchFacade.new("Pulp")
  end
end