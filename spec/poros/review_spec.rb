require 'rails_helper'

RSpec.describe Review do
  it "exists" do
    attrs = {
      author: "Joe Schmoe"
    }

    review = Review.new(attrs)

    expect(review).to be_a Review
    expect(review.author).to eq("Joe Schmoe")
  end
end