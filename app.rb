require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
  def initialize
    @people = []
    @books = []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      if person.instance_of?(Student)
        puts "[Student] Id: #{person.id}, Name: #{person.name},
         Age: #{person.age}, Classroom: #{person.classroom.label}"
      else
        puts "[Teacher] Id: #{person.id}, Name: #{person.name}, Age: #{person.age},
         Specialization: #{person.specialization}"
      end
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_person
    loop do
      puts 'Pick the type of person you want to create. Numeric values only: [1] Student or [2] Teacher'
      selection = gets.chomp
      case selection
      when '1'
        puts "What's the student's name?"
        name = gets.chomp
        loop do
          break if name.length.positive?

          puts 'Incorrect input. Please include a valid name'
          name = gets.chomp
        end
        puts "What's the student's age?"
        age = gets.chomp
        loop do
          age = age.to_i
          break if age.positive?

          puts 'Incorrect input. Please include a valid age'
          age = gets.chomp
        end
        puts "What's the student's classroom?"
        classroom = Classroom.new(gets.chomp)
        student_permission = true
        loop do
          puts 'Does the student has permision? (Y/N)'
          permision = gets.chomp.downcase
          case permision
          when 'n'
            student_permission = false
            break
          when 'y'
            break
          else
            puts 'Incorrect Input. Please type a valid value'
          end
        end
        student = Student.new(classroom, age, parent_permission: student_permission, name: name)
        @people << student
        break
      when '2'
        puts 'Nice again'
        break
      else
        puts 'Pick a proper value'
        puts '-------------------'
      end
    end
  end
end

testapp = App.new

testapp.create_book('A', 'B')
testapp.create_book('C', 'B')
testapp.create_book('D', 'B')

testapp.list_all_books

testapp.create_person

testapp.list_all_people
