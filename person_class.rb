class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    of_ages? || @parent_permission
  end

  private

  def of_ages?
    @age >= 18
  end
end

person = Person.new(13, 'ibrahim')
person.name = 'ibu'
print person.name
print person.can_use_services
