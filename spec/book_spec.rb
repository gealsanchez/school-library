require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Book do
  before :each do
    @book = Book.new 'Barcelona', 'Robert Lewandosky'
    @student = Student.new 21, 'Eddie'
    @date = '04/26/2023'
  end
  context 'When testing the Book class' do
    it 'Book Object must be returned' do
      expect(@book).to be_an_instance_of Book
    end

    it 'return correct Title' do
      expect(@book.title).to eql('Barcelona')
    end

    it 'Rented Book should be added to book rental list' do
      @book.add_rental(@date, @student)
      expect(@book.rentals.length).to eql 2
    end
  end
end
