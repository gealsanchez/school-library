require_relative 'app'

class Option
  def initialize()
    @app = App.new()
  end

  def option_selector(option)
    list_all_books if option == '1'
    list_all_people if option == '2'
    extra_option if option == '3'
    create_book if option == '4'
    create_rental if option == '5'
    list_all_rentals_by_given_id if option == '6'
    exit! if option == '7'
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
end