module Checks
  def str_check(message: 'Enter your value', error: 'Incorrect Value. Please enter again')
    puts message
    str = gets.chomp
    loop do
      break if str.length.positive?

      puts error
      str = gets.chomp
    end
    str
  end

  def int_check(message: 'Enter your value', error: 'Incorrect Value. Please enter again')
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

  def yes_or_not(message: 'Enter your option (Y/N)', error: 'Incorrect Value. Please enter again')
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
end
