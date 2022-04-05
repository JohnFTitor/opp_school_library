# interface

class Nameable
  def correct_name
    raise NotImplementedError
  end
end

# base decorator

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# decorators

class CapitalizeDecorator < BaseDecorator  
  def correct_name
    @nameable.correct_name.capitalize
  end
end
