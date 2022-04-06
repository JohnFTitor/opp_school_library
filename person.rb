require_relative 'decorators'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rents

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = Random.rand(0..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rents = []
  end

  def of_age?
    # Had to change name per linters
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rents << rental unless @rents.include?(rental)
  end 
end
