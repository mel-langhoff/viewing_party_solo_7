require 'rails_helper'

RSpec.describe CastMember do
  it "exists" do
    attrs = {
      name: "Johnny Depp",
      character: "Captain Jack Sparrow"
    }

    castmember = CastMember.new(attrs)

    expect(castmember).to be_a CastMember
    expect(castmember.name).to eq("Johnny Depp")
    expect(castmember.character).to eq("Captain Jack Sparrow")
  end
end