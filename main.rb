require_relative 'option'
require_relative 'storage'

class Menu
  attr_accessor :storage

  def initialize
    @storage = Storage.new
    @program = true
    acquire_data
    @option = Option.new(self)
    methods_list
  end

  def acquire_data
    @storage.acquire_data
  end

  def methods_list
    puts
    puts 'Welcome to School library App!'
    puts
    puts "Please choose an option by entering the number: \n
      1 - List all books.
      2 - List all people.
      3 - Create a person.
      4 - Create a book.
      5 - Create a rental.
      6 - List all rentals for a given person id.
      7 - Exit application. \n "
    select_option
  end

  def select_option()
    while @program
      number = gets.chomp
      puts
      @option.option_selector(number)
      methods_list
    end
  end
end

def main
  Menu.new
end

main
