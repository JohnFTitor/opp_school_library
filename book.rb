class Book
  attr_accessor :title, :author
  attr_reader :rents

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end
end
