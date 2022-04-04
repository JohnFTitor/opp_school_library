class Person
  attr_accessor :name
  attr_accessor :age
  attr_reader :id

  def initialize(name = "Unknown", age, parent_permission: true)
    @id = Random.rand(0..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age?
    @age >= 18
  end
  
  private :is_of_age?

  def can_use_services?
    is_of_age? || @parent_permission
  end
end

john_titor = Person.new('John Titor', 35, parent_permission: false)

puts john_titor.name
puts john_titor.age
puts john_titor.id
puts john_titor.can_use_services?
