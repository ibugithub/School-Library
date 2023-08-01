class Person
    attr_reader :id
    attr_accessor :name
    attr_accessor :age

    def initialize(age, name = "Unknown", parent_permission = true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def can_use_services 
        if of_ages? || @parent_permission
            return true
        else
           return false
        end
    end

    private 
    def of_ages? 
        if @age >= 18
           return true
        else
          return  false
        end
    end

end


person = Person.new(13, 'ibrahim')
person.name ='ibu'
print person.name
print person.can_use_services