require_relative 'app'

class Menu
  def initialize
    @app = App.new(self)
    methods_list
  end

  def methods_list
    puts "Please choose an option by entering the number: \n
      1 - List all books.
      2 - List all people.
      3 - Create a person.
      4 - Create a book.
      5 - Create a rental.
      6 - List all rentals for a given person id.
      7 - Exit application. \n "
    number = gets.chomp
    puts
    select_option(number)
  end

  def select_option(number)
    list = {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_all_rentals_by_given_id,
      '7' => :exit
    }
    method_name = list[number]
    @app.send(method_name)
  end
end

def main
  Menu.new
end

main
