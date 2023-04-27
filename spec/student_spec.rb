require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Student do
  before :each do
    @student = Student.new 24, 25
  end
  context 'When testing the Student class' do
    it 'Given age and a name Object must be returned' do
      expect(@student).to be_an_instance_of Student
    end

    it 'Should return Unknown if the method does not receive any parameter' do
      expect(@student.name).to eql 'Unknown'
    end
  end
end
