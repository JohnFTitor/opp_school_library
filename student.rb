require_relative 'person'

class Student < Person
  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

john_titor = Student.new('Computer Science', 15,
                         name: 'John Titor The Second', parent_permission: false)

puts john_titor.name
puts john_titor.age
puts john_titor.id
puts john_titor.can_use_services?
puts john_titor.play_hooky
