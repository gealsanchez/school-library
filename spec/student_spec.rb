require_relative '../book'
require_relative '../student'
require_relative '../rental'
require 'json'

describe Student do
  before :each do
    @student = Student.new 24, 'Eddie'
  end
  context 'When testing the Student class' do
    it 'Given age and a name Object must be returned' do
      expect(@student).to be_an_instance_of Student
    end
  end
end
