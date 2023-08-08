require './class_room'
require './student_class'
require './teacher_class'
require './book_class'
require './rental_class'

class App
  attr_accessor :people, :books, :rentals

  def show_people(show_index: false)
    people = load_from_json('person.json')
    if people.nil?
      puts 'There are no people available'
    elsif show_index
      people.each_with_index do |person, index|
        puts " #{index}) [#{person['identity']}] Name: #{person['name']}. Age: #{person['age']}  Id: #{person['id']}"
      end
    else
      people.each do |person|
        puts "[#{person['identity']}]: #{person['identity']}. Age: #{person['age']}  Id: #{person['id']}"
      end
    end
  end

  def show_book(show_index: false)
    books = load_from_json('books.json')
    if books.nil?
      puts 'There are no books'
    elsif show_index
      books.each_with_index do |book, index|
        puts " #{index}) [Book] Title: #{book['title']}. Author: #{book['author']}"
      end
    else
      books.each do |book|
        puts "[Book] Title: #{book['title']}. Author: #{book['author']}"
      end
    end
  end

  def create_student(age, name, permission)
    class_room = Classroom.new('Planetary101')
    student = Student.new(age, class_room, permission, name)
    student.identity = 'Student'
    save_to_person(student)
  end

  def create_teacher(age, name, spec)
    teacher = Teacher.new(age, spec, name)
    teacher.identity = 'Teacher'
    save_to_person(teacher)
  end

  def create_book(title, author)
    book = Book.new(title, author)
    save_to_book(book)
  end

  def create_rental(person_index, book_index, date)
    person = load_from_json('person.json')[person_index]
    book = load_from_json('books.json')[book_index]
    person = Person.new(person['age'], person['name'], parent_permission: person['permission'])
    book = Book.new(book['title'], book['author'])
    if person.nil? || book.nil?
      puts 'Invalid book or person'
      return
    end
    rental = Rental.new(date, book, person)
    # p 'the saved rentals are ', rental
    save_to_rentals(rental)
    puts 'Rental has been created successfully'
  end

  def show_rental
    rentals = load_from_json('rentals.json')
    p 'the rentals are', rentals
    if rentals.nil?
      puts 'There are no rentals'
    else
      print 'Id of the person: '
      person_id = gets.chomp.to_i
      found_rental = rentals.select { |rental| rental['person_id'] == person_id }
      if found_rental
        puts 'Rentals: '
        found_rental.each do |rental|
          puts "[Rentals] Date: #{rental['date']} Book: #{rental['title']} by #{rental['author']}"
        end
      else
        puts 'No matched rentals found by the Id'
      end
    end
  end

  def save_to_person(person)
    person_obj = { name: person.name, id: person.id, age: person.age, permissions: person.parent_permission,
                   identity: person.identity }
    save_to_json(person_obj, 'person.json')
  end

  def save_to_book(book)
    books = { title: book.title, author: book.author }
    save_to_json(books, 'books.json')
  end

  def save_to_rentals(rental)
    rentals_obj = { date: rental.date, title: rental.book.title, author: rental.book.author,
                    person_id: rental.person.id }
    p 'the  rental_obj is', rentals_obj
    save_to_json(rentals_obj, 'rentals.json')
  end

  def load_from_json(filename)
    return [] unless File.exist?(filename)

    data = File.read(filename)
    JSON.parse(data) unless data.empty?
  end

  def save_to_json(json, filename)
    json_data = load_from_json(filename) || []
    json_data << json
    File.write(filename, JSON.generate(json_data))
  end
end
