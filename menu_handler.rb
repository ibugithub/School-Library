require './app'
require 'json'
# This class responsible for the user interface (menu) and for
# calling the methods of the App class.
class MenuHandler
  def initialize
    @app = App.new
    @first_time = true
  end

  def clear_console
    if RUBY_PLATFORM =~ /win32|win64|x64|\.NET|windows|cygwin|mingw32/i
      system('cls')
    else
      system('clear')
    end
  end

  def welcome_message
    puts "\n\n* * * * WELCOME TO SCHOOL LIBRARY * * * *\n\n"
  end

  def pause
    puts "\nPress enter to continue"
    gets
  end

  def intro
    if @first_time
      @first_time = false
    else
      pause
    end
    clear_console
    welcome_message
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
    print 'Please enter a number: '
    gets.chomp
  end

  def show_book
    @app.show_book
  end

  def show_people
    @app.show_people
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]:'
    input = gets.chomp
    if input == '1'
      create_student
    elsif input == '2'
      create_teacher
    else
      puts 'Invalid input'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has Parent permissions? [Y/N]: '
    permissions = gets.chomp.downcase
    if permissions == 'y'
      permission = true
    elsif permissions == 'n'
      permission = false
    else
      puts 'invalid input'
      return
    end
    @app.create_student(age, name, permission)
    puts "Student #{name} has been created successfully"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    spec = gets.chomp
    @app.create_teacher(age, name, spec)
    puts "Teacher #{name} has been created successfully"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
    puts "Book #{title} has been created successfully"
  end

  def create_rental
    puts 'Select the a book from the following list by a number: '
    books = @app.show_book(show_index: true)
    return if books.empty?

    book_index = gets.to_i

    puts 'Select the a person from the following list by a number: '
    people = @app.show_people(show_index: true)
    return if people.empty?

    person_index = gets.to_i

    print 'Date: '
    date = gets.chomp
    @app.create_rental(person_index, book_index, date)
  end

  def show_rental
    @app.show_rental
  end

end
