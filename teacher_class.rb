require './person_class'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end

teacher = Teacher.new(43, 'musa', 'physics')
puts teacher.can_use_services
