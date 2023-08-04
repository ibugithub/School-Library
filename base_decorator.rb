require './name_able'

class BaseDecorator < Nameable
  def initialize(name_able)
    super()
    @name_able = name_able
  end

  def correct_name
    @name_able.correct_name
  end
end
