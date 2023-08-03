require './name_able'
require './capatalized_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services
    of_ages? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  private

  def of_ages?
    @age >= 18
  end
end
