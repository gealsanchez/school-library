require_relative '../base_decorator'
require_relative '../capitalize_decorator'
require_relative '../nameable'
require_relative '../trimmer_decorator'
require_relative '../person'

describe Nameable do
  before :each do
    @nameable = Nameable.new
  end

  context 'When testing a Nameable class' do
    it 'creates an instance of Nameable object' do
      expect(@nameable).to be_an_instance_of Nameable
    end
  end

  context 'When using correct_name method' do
    it 'shows an error' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe BaseDecorator do
  before :each do
    @person = Person.new(23, name: 'PhilAllenCrosby')
    @base_decorator = BaseDecorator.new(@person)
  end

  context 'When testing a BaseDecorator class' do
    it 'creates an instance of BaseDecorator object' do
      expect(@base_decorator).to be_an_instance_of BaseDecorator
    end
  end

  context 'When using correct_name method' do
    it 'should return the correct name' do
      expect(@base_decorator.correct_name).to eql 'PhilAllenCrosby'
    end
  end
end

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(23, name: 'PhilAllenCrosby')
    @capitalize = CapitalizeDecorator.new(@person)
  end

  context 'When testing a CapitalizeDecorator class' do
    it 'creates an instance of CapitalizeDecorator object' do
      expect(@capitalize).to be_an_instance_of CapitalizeDecorator
    end
  end

  context 'When using correct_name method' do
    it 'returns the name whithout the capitals except for the first one' do
      expect(@capitalize.correct_name).to eql 'Philallencrosby'
    end
  end
end

describe TrimmerDecorator do
  before :each do
    @person = Person.new(23, name: 'PhilAllenCrosby')
    @trimmer = TrimmerDecorator.new(@person)
  end

  context 'When testing a TrimmerDecorator class' do
    it 'creates an instance of TrimmerDecorator object' do
      expect(@trimmer).to be_an_instance_of TrimmerDecorator
    end
  end

  context 'When using correct_name method' do
    it 'returns name below to 10 characters' do
      expect(@trimmer.correct_name).to eql 'PhilAllenC'
    end
  end
end
