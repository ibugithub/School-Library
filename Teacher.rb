require './Person.rb'

class Teacher < Person
    def initialize(age, name="Unknown", parent_permission=true, specialization)
        super(age, name, parent_permission)
        @specialization =  specialization
    end

    def can_use_services
       return true
    end
end

teacher = Teacher.new(43, 'musa', true, 'physics')
puts teacher.can_use_services