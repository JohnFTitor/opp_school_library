require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def change_classroom(classroom) 
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end


computer_science = Classroom.new('Computer Science')

john_titor = Student.new(computer_science, 15,
                         name: 'John Titor The Second', parent_permission: false)
zeeshan = Student.new(computer_science, 15,
                         name: 'Zeeshan')
leonardo = Student.new(computer_science, 15,
                         name: 'Leonardo')

puts john_titor.classroom.label
puts zeeshan.classroom.label
puts leonardo.classroom.label

computer_science.students.each do |student|
  puts student.name
end

time_traveling = Classroom.new('Time Traveling Paranoia')

john_titor.change_classroom(time_traveling)

puts john_titor.classroom.label
puts zeeshan.classroom.label
puts leonardo.classroom.label

time_traveling_and_AI = Classroom.new('Time Traveling and AI')

time_traveling_and_AI.add_student(zeeshan)
time_traveling_and_AI.add_student(leonardo)

puts john_titor.classroom.label
puts zeeshan.classroom.label
puts leonardo.classroom.label

time_traveling_and_AI.students.each do |student|
  puts student.name
end
