require_relative 'app'

class Option
  attr_accessor :menu

  def initialize(menu)
    @menu = menu
    @app = App.new(self)
  end

  def option_selector(option)
    option_map = {
      '1' => 'list_all_books',
      '2' => 'list_all_people',
      '3' => 'extra_option',
      '4' => 'create_book',
      '5' => 'create_rental',
      '6' => 'list_all_rentals_by_given_id',
      '7' => 'close_app'
    }
    send(option_map[option])
  end

  def extra_option
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]'
    person = gets.chomp
    case person
    when '1'
      @app.create_student
    when '2'
      @app.create_teacher
    else
      puts 'Please choose 1 or 2!'
    end
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_people
    @app.list_all_people
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_all_rentals_by_given_id
    @app.list_all_rentals_by_given_id
  end

  def close_app
    exit!
  end
end
