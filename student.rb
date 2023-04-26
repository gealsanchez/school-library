require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(_classroom, age, name: 'Unknown', parent_permission: true, id: nil)
    super(age, name: name, parent_permission: parent_permission, id:id)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

