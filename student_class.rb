require './person_class'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, classroom, permission, name = 'Unknown')
    super(age, name, parent_permission: permission)
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
