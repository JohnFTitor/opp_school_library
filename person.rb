class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(0..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age? #Had to change name per linters
    @age >= 18
  end

  private :is_of_age?

  def can_use_services?
    is_of_age? || @parent_permission
  end
end

john_titor = Person.new(35, parent_permission: false, name: 'John Titor')

puts john_titor.name
puts john_titor.age
puts john_titor.id
puts john_titor.can_use_services?
