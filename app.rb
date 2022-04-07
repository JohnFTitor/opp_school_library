require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'value_check'
require_relative 'rental'

class App
  include Checks

  def initialize
    @people = []
    @books = []
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts "[#{index + 1}] Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each_with_index do |person, index|
      if person.instance_of?(Student)
        puts "[#{index + 1}][Student] Id: #{person.id}, Name: #{person.name},
         Age: #{person.age}, Classroom: #{person.classroom.label}"
      else
        puts "[#{index + 1}][Teacher] Id: #{person.id}, Name: #{person.name}, Age: #{person.age},
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
                     error: 'Wrong input. Please include a valid name')
    age = int_check(message: "What's the student's age?",
                    error: 'Wrong input. Please introduce a valid age')
    classroom = str_check(message: "What's the student's classroom?")
    classroom = Classroom.new(classroom)
    student_permission = true
    student_permission = yes_or_not(message: 'Does the student have permission? (Y/N)') if age < 18
    Student.new(classroom, age, parent_permission: student_permission, name: name)
  end

  def create_teacher
    name = str_check(message: "What's the teacher's name?",
                     error: 'Wrong input. Please include a valid name')
    age = int_check(message: "What's the teacher's age?",
                    error: 'Wrong input. Please introduce a valid age')
    specialization = str_check(message: "What's the teacher's specialization?")
    Teacher.new(specialization, age, name: name)
  end

  private :create_student, :create_teacher

  def create_person
    loop do
      puts 'Pick the type of person you want to create. Numeric values only: [1] Student or [2] Teacher'
      selection = gets.chomp
      person = nil
      case selection
      when '1'
        person = create_student
      when '2'
        person = create_teacher
      else
        puts 'Pick a proper value'
      end
      next unless person

      @people << person
      puts 'Person added succesfully'
      break
    end
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts 'Not enough parameters to create rental'
      return
    end
    list_all_books
    index_book = index_in(@books, message: 'Pick a book from the list using its index')
    book = @books[index_book]
    list_all_people
    index_people = index_in(@people, message: 'Pick a person from the list using its index')
    person = @people[index_people]
    date = enter_date
    Rental.new(date, book, person)
  end
end

testapp = App.new

testapp.create_rental

testapp.create_book('A', 'B')
testapp.create_book('C', 'B')
testapp.create_book('D', 'B')

testapp.list_all_books

testapp.create_person

testapp.list_all_people

testapp.create_rental
