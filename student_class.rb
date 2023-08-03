require './person_class'

class Student < Person
  def initialize(age, classroom, name = 'Unknown')
    super(age, name)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
