class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @name_able.correct_name
    name.length > 10 ? name[0..9] : name
  end
end
