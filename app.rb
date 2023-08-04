require './class_room'
require './student_class'
require './teacher_class'
require './book_class'
require './rental_class'
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def intro
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def show_people(show_index: false)
    if @people.empty?
      puts 'There are no people available'
    elsif show_index
      @people.each_with_index do |person, index|
        puts " #{index}) [#{person.identity}] Name: #{person.name}. Age: #{person.age}  Id: #{person.id}"
      end
    else
      @people.each do |person|
        puts "[#{person.identity}]: #{person.name}. Age: #{person.age}  Id: #{person.id}"
      end
    end
    puts
  end

  def show_book(show_index: false)
    if @books.empty?
      puts 'There are no books'
    elsif show_index
      @books.each_with_index do |book, index|
        puts " #{index}) [Book] Title: #{book.title}. Author: #{book.author}"
      end
    else
      @books.each do |book|
        puts "[Book] Title: #{book.title}. Author: #{book.author}"
      end
    end
    puts
  end

  def create_student(age, name, permission)
    class_room = Classroom.new('Planetary101')
    student = Student.new(age, class_room, name, permission)
    student.identity = 'Student'
    @people << student
    print 'Student ', student.name, ' has been created successfully'
    puts
  end

  def create_teacher(age, name, spec)
    teacher = Teacher.new(age, spec, name)
    puts 'teacher ', teacher.name, ' has been created successfully'
    teacher.identity = 'Teacher'
    @people << teacher
    puts
  end

  def create_book(title, author)
    book = Book.new(title, author)
    print 'Book ', book.title, ' has been created successfully'
    @books << book
    puts
  end

  def create_rental(person_index, book_index, date)
    person = @people[person_index]
    book = @books[book_index]
    rental = Rental.new(date, book, person)
    print 'Rental has been created successfully'
    @rentals << rental
    puts
  end

  def show_rental
    if @rentals.empty?
      puts 'There are no rentals'
    else
      puts 'Id of the person: '
      person_id = gets.chomp.to_i
      found_rental = @rentals.select { |rental| rental.person.id == person_id }
      if found_rental
        puts 'Rentals: '
        found_rental.each do |rental|
          puts "[Rentals] Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
        end
      else
        puts 'No matched rentals found by the Id'
      end
    end
    puts
  end
end
