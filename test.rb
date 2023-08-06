class Dog 
    def walking
        return '*walking*' 
    end 

    def speak 
        return 'woof' 
    end
end 

class JackRussell < Dog 
    def speak 
        return 'woof woof'
    end
end 

jack = JackRussell.new()
puts jack.speak()