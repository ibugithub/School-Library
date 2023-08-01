require './Person.rb'

class Student < Person
    def initialize(age, name = "Unknown", parent_permission = true, classroom)
        super(age, name, parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end

end

student = Student.new(15, 'ibu', false, 'English 101')
puts student.play_hooky