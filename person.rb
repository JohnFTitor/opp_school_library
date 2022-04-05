require_relative 'decorators'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = Random.rand(0..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
end

john_titor = Person.new(35, parent_permission: false, name: 'john titor third king of England')
puts john_titor.correct_name
new_john_titor = CapitalizeDecorator.new(john_titor)
puts new_john_titor.correct_name
