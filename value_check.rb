module Checks
  def str_check(message: 'Enter your value', error: 'Wrong Value. Please enter again')
    puts message
    str = gets.chomp
    loop do
      break if str.length.positive?

      puts error
      str = gets.chomp
    end
    str
  end

  def int_check(message: 'Enter your value', error: 'Wrong Value. Please enter again')
    puts message
    int = gets.chomp
    loop do
      int = int.to_i
      break if int.positive?

      puts error
      int = gets.chomp
    end
    int
  end

  def yes_or_not(message: 'Enter your option (Y/N)', error: 'Wrong Value. Please enter again')
    option = true
    loop do
      puts message
      evaluate = gets.chomp.downcase
      case evaluate
      when 'n'
        option = false
        break
      when 'y'
        break
      else
        puts error
      end
    end
    option
  end

  def index_in(array, message: 'Select by index', error: 'Index out of range. Pick again')
    loop do
      index = int_check(message: message) - 1
      value = array[index]
      return index if value

      puts error
    end
  end

  def enter_date
    loop do
      puts 'Enter date in the following format YYYY/MM/DD'
      date = gets.chomp
      return date if date.match(/([0-9]){4}\/([0-9]){2}\/([0-9]){2}/)
      puts 'Wrong input'
    end
  end
end
