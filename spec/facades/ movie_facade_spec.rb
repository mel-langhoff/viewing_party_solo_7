require 'rails_helper'

RSpec.describe MovieFacade do
  it "exists" do
    facade = MovieFacade.new("Pulp")

    expect(facade).to be_a MovieFacade
  end

  it "#vote_average" do

  end
end