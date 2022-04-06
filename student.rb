require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require 'date'

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

puts '-------Testing for Classroom---------'
puts '---Classroom labels---'
puts john_titor.classroom.label
puts zeeshan.classroom.label
puts leonardo.classroom.label

puts '---Classroom students---'
computer_science.students.each do |student|
  puts student.name
end

puts '---Student Change Classroom---'
time_traveling = Classroom.new('Time Traveling Paranoia')

john_titor.change_classroom(time_traveling)

puts john_titor.classroom.label
puts zeeshan.classroom.label
puts leonardo.classroom.label

puts '---Classroom adds students---'
time_traveling_and_AI = Classroom.new('Time Traveling and AI')

time_traveling_and_AI.add_student(zeeshan)
time_traveling_and_AI.add_student(leonardo)

puts john_titor.classroom.label
puts zeeshan.classroom.label
puts leonardo.classroom.label

time_traveling_and_AI.students.each do |student|
  puts student.name
end

puts '---------Testing for Rentals-----------'

my_book_1 = Book.new('Time Travel Paranoia V1', 'John Titor')
my_book_2 = Book.new('Time Travel Paranoia V2', 'Francis Titor')
my_book_3 = Book.new('Time Travel Paranoia V3', 'Emilia Titor')

rental_1 = Rental.new(Date.new(2022, 4, 6), my_book_1, john_titor)
rental_2 = Rental.new(Date.new(2022, 4, 6), my_book_1, zeeshan)
rental_3 = Rental.new(Date.new(2022, 4, 6), my_book_2, john_titor)
rental_4 = Rental.new(Date.new(2022, 4, 6), my_book_2, leonardo)
rental_5 = Rental.new(Date.new(2022, 4, 6), my_book_3, leonardo)

puts '---First Book People---'
my_book_1.rents.each do |rent|
  puts rent.person.name
end
puts '---Second Book People---'
my_book_2.rents.each do |rent|
  puts rent.person.name
end
puts '---Third Book People---'
my_book_3.rents.each do |rent|
  puts rent.person.name
end
puts '---John Rented Books---'
john_titor.rents.each do |rent|
  puts rent.book.title
  puts rent.book.author 
end
puts '---Zeeshan Rented Books---'
zeeshan.rents.each do |rent|
  puts rent.book.title
  puts rent.book.author 
end
puts '---Leonardo Rented Books---'
leonardo.rents.each do |rent|
  puts rent.book.title
  puts rent.book.author 
end
