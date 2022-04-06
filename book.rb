require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rents

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rents << rental unless @rents.include?(rental)
  end
end
