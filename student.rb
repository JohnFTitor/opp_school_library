require_relative 'person'

class Student < Person
  def initialize(classroom, name = "Unknown", age, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end 

john_titor = Student.new('Computer Science',
  'John Titor The Second', 15, parent_permission: false)

puts john_titor.name
puts john_titor.age
puts john_titor.id
puts john_titor.can_use_services?
puts john_titor.play_hooky
