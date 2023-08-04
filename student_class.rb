require './person_class'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown')
    super(age, name)
    @classroom = classroom
    classroom.add_student(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
