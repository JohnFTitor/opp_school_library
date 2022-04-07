require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'value_check'

class App
  include Checks

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

  def create_student
    name = str_check(message: "What's the student's name?",
                     error: 'Incorrect input. Please include a valid name')
    age = int_check(message: "What's the student's age?",
                    error: 'Incorrect input. Please introduce a valid age')
    classroom = str_check(message: "What's the student's classroom?")
    classroom = Classroom.new(classroom)
    student_permission = true
    student_permission = yes_or_not(message: 'Does the student have permission? (Y/N)') if age < 18
    Student.new(classroom, age, parent_permission: student_permission, name: name)
  end

  def create_teacher
    name = str_check(message: "What's the teacher's name?",
                     error: 'Incorrect input. Please include a valid name')
    age = int_check(message: "What's the teacher's age?",
                    error: 'Incorrect input. Please introduce a valid age')
    specialization = str_check(message: "What's the teacher's specialization?")
    Teacher.new(specialization, age, name: name)
  end

  private :create_student, :create_teacher

  def create_person
    loop do
      puts 'Pick the type of person you want to create. Numeric values only: [1] Student or [2] Teacher'
      selection = gets.chomp
      case selection
      when '1'
        student = create_student
        @people << student
        break
      when '2'
        teacher = create_teacher
        @people << teacher
        break
      else
        puts 'Pick a proper value'
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
