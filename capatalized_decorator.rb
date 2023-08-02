require './base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @name_able.correct_name.capitalize
  end
end
