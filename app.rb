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

    # returns @people to validate if it is empty or not
    @people 
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

    # returns @books to validate if it is empty or not
    @books
  end

  def create_student(age, name, permission)
    class_room = Classroom.new('Planetary101')
    student = Student.new(age, class_room, permission, name)
    student.identity = 'Student'
    @people << student
  end

  def create_teacher(age, name, spec)
    teacher = Teacher.new(age, spec, name)
    teacher.identity = 'Teacher'
    @people << teacher
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(person_index, book_index, date)
    person = @people[person_index]
    book = @books[book_index]
    if person.nil? || book.nil?
      puts 'Invalid book or person'
      return
    end
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental has been created successfully"
  end

  def show_rental
    if @rentals.empty?
      puts 'There are no rentals'
    else
      print 'Id of the person: '
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
  end
end
