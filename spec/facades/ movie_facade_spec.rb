require 'rails_helper'

RSpec.describe MovieFacade do
  it "exists" do
    facade = MovieFacade.new("Pulp")

    expect(facade).to be_a MovieFacade
  end

  it "#movies" do
    # bitchin code goes here
  end
end