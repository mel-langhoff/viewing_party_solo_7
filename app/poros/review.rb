class Review
  attr_reader :author, :review

  def initialize(attributes)
    @author = attributes[:author]
    @review = attributes[:content]
  end
end