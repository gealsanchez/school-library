require_relative '../teacher'
require 'json'

describe Teacher do
  before :each do
    @teacher = Teacher.new 45, 'Biology'
  end
  context 'When testing the Teacher class' do
    it 'Given age, and specialization teacher object must be returned' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end
end
