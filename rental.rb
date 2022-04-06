class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rents << self

    @person = person
    person.rents << self
  end
end
