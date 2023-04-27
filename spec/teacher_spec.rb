require_relative '../teacher'
require_relative '../person'

describe Teacher do
  before :each do
    @teacher = Teacher.new 45, 'Biology'
  end
  context 'When testing the Teacher class' do
    it 'Given age, and specialization teacher object must be returned' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'Should return true if the person can use the service' do
      expect(@teacher.can_use_services?).to eql true
    end

    it 'Should return Unknown if the method does not receive any parameter' do
      expect(@teacher.name).to eql 'Unknown'
    end
  end
end
