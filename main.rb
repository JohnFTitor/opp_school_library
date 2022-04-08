#!/usr/bin/env ruby
require_relative 'app'

def print_message
  puts "\n"
  puts "Welcome to Alexandria's school library. Please select an option using one of the numbers:"
  puts "
  [1] - List All Books
  [2] - List All People
  [3] - Create a Person
  [4] - Create a Book
  [5] - Create a Rental
  [6] - List All Rentals for a given person
  [7] - Exit"
end

def run_method(selection, app)
  case selection
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  else
    puts 'Wrong value. Going again'
  end
end

def main
  alexandria = App.new
  loop do
    print_message
    selection = gets.chomp
    break if selection == '7'

    run_method(selection, alexandria)
  end
end

main
