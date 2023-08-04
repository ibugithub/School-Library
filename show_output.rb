require './class_room'
require './student_class'
require './person_class'
require './capatalized_decorator'
require './trimmer_decorator'
require './rental_class'
require './book_class'

# Create Association
neuro_science = Classroom.new('NeuroScience')
Student.new(12, neuro_science, 'ibu')
Student.new(12, neuro_science, 'nibu')

neuro_science.students.map { |student| puts student.name }

person_ibu = Person.new(23, 'ibrahim')
person_nibu = Person.new(18, 'Nusrat')

book_love = Book.new('Loving Intro', 'ibrahim')
book_build = Book.new("Let's build the world", 'ibrahim')
book_move = Book.new("Let's go to mars", 'nusrat')
book_hate = Book.new('The end of hating story', 'nusrat')

Rental.new('2018-2-13', book_love, person_ibu)
Rental.new('2018-2-13', book_love, person_nibu)
Rental.new('2020-3-1', book_build, person_ibu)
Rental.new('2022-1-19', book_move, person_nibu)
Rental.new('2022-8-19', book_hate, person_nibu)

book_love.rentals.map { |rent| puts rent.person.name }
person_ibu.rentals.map { |rent| puts rent.book.title }
person_nibu.rentals.map { |rent| puts rent.book.title }


# Create basicUi
class_room = Classroom.new('Planetary101')
student = Student.new(12, class_room, 'ibu')
puts student.name
