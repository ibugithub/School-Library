class Nameable
  def correct_name
    raise NotImplementedError, 'The correct name has not been implemented yet'
  end
end

class BaseDecorator < Nameable
  def initialize(name_able)
    super()
    @name_able = name_able
  end

  def correct_name
    @name_able.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @name_able.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @name_able.correct_name
    name.length > 10 ? name[0..9] : name
  end
end

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    of_ages? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_ages?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
