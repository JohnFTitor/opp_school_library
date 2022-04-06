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
time_traveling_and_ai = Classroom.new('Time Traveling and AI')

time_traveling_and_ai.add_student(zeeshan)
time_traveling_and_ai.add_student(leonardo)

puts john_titor.classroom.label
puts zeeshan.classroom.label
puts leonardo.classroom.label

time_traveling_and_ai.students.each do |student|
  puts student.name
end

puts '---------Testing for Rentals-----------'

my_book1 = Book.new('Time Travel Paranoia V1', 'John Titor')
my_book2 = Book.new('Time Travel Paranoia V2', 'Francis Titor')
my_book3 = Book.new('Time Travel Paranoia V3', 'Emilia Titor')

Rental.new(Date.new(2022, 4, 6), my_book1, john_titor)
Rental.new(Date.new(2022, 4, 6), my_book1, zeeshan)
Rental.new(Date.new(2022, 4, 6), my_book2, john_titor)
Rental.new(Date.new(2022, 4, 6), my_book2, leonardo)
Rental.new(Date.new(2022, 4, 6), my_book3, leonardo)

puts '---First Book People---'
my_book1.rents.each do |rent|
  puts rent.person.name
end

puts '---Second Book People---'
my_book2.rents.each do |rent|
  puts rent.person.name
end

puts '---Third Book People---'
my_book3.rents.each do |rent|
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

puts '--Add rental through book--'
my_book1.add_rental(Date.new(2022, 4, 6), leonardo)

puts '---Leonardo Rented Books---'
leonardo.rents.each do |rent|
  puts rent.book.title
  puts rent.book.author
end

puts '--Add rental through Person--'
my_book1.add_rental(Date.new(2022, 4, 6), leonardo)
zeeshan.add_rental(Date.new(2022,5,6), my_book2)

puts '---Zeeshan Rented Books---'
zeeshan.rents.each do |rent|
  puts rent.book.title
  puts rent.book.author
end
