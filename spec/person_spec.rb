require_relative '../book'
require_relative '../teacher'
require_relative '../rental'
require 'json'

describe Person do
  before :each do
    @person = Person.new 12
    @teacher = Teacher.new 45, 'Lee'
    @book = Book.new 'Barcelona', 'Robert Lewandosky'
    @rental = Rental.new '04/26/2023', @book, @teacher
  end
  context 'When testing the Book class' do
    it 'Given id, age, name  and permission a Person Object must be returned' do
      expect(@person).to be_an_instance_of Person
    end

    it 'Should return true if the person can use the service' do
      expect(@person.can_use_services?).to eql true
    end

    it 'Rented Book should be added to book rental list' do
      @person.add_rental(@rental)
      puts @book.rentals
      expect(@book.rentals.length).to eql 1
    end
  end
end
