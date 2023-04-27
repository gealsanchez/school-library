require_relative '../classroom'
require_relative '../student'
describe Classroom do
  describe '>> new classroom' do
    it '>> Create new classroom' do
      # Arrange
      @classroom = Classroom.new('Classroom 5')

      # Act
      label = @classroom.label

      # Assert
      expect(label).to eq 'Classroom 5'
    end

    it '>> Add an student' do
      # Arrange
      classroom = Classroom.new('Classroom 5')
      student = Student.new(17, 'Koami')

      # Act
      classroom.add_student(student)
      number_of_students = classroom.students.length

      # Assert
      expect(number_of_students).to eq 1
    end
  end
end
