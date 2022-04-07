require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name: 'Unknown')
    super(age, parent_permission: true, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
