require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = "Unknown", age, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

john_titor = Teacher.new('Time Traveling',
  'John Titor The Original', 36, parent_permission: false)

puts john_titor.name
puts john_titor.age
puts john_titor.id
puts john_titor.can_use_services?
