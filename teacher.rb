require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

john_titor = Teacher.new('Time Traveling', 36,
                         name: 'John Titor The Original', parent_permission: false)

puts john_titor.name
puts john_titor.age
puts john_titor.id
puts john_titor.can_use_services?
