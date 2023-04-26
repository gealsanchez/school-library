require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize(option)
    @option = option
    @storage = option.menu.storage
    @person = @storage.person
    @books = @storage.book
    @rentals = @storage.rental
  end

  def list_all_books
    @books.each { |elem| puts "Title: #{elem['title']} Author: #{elem['title']}" }
  end

  def list_all_people
    @person.each { |elem| puts "Id: #{elem['id']} Name: #{elem['name']} Age: #{elem['age']}" }
  end

  def create_student
    age = ask_user('Age: ').to_i
    name = ask_user('Name: ')
    parent_permission = ask_user('Has parent permission? [Y/N]: ').downcase == 'y'

    student = Student.new('B1', age, name: name, parent_permission: parent_permission)
    @person << { 'id' => student.id, 'name' => student.name, 'age' => student.age, parent_permission: true }
    @storage.add_data(@storage.person_path, @person, 'person')
    puts
    puts 'Student created successfuly!'
    puts
    @option.menu.methods_list
  end

  def create_teacher
    age = ask_user('Age: ').to_i
    name = ask_user('Name: ')
    specialization = ask_user('Specialization: ')

    teacher = Teacher.new(age, specialization, name: name)
    @person << {
      'id' => teacher.id,
      'name' => teacher.name,
      'age' => teacher.age,
      'specialization' => teacher.specialization
    }
    @storage.add_data(@storage.person_path, @person, 'person')
    puts
    puts 'Teacher created successfuly!'
    puts
    @option.menu.methods_list
  end

  def create_book
    title = ask_user('Title: ')
    author = ask_user('Author: ')

    book = Book.new(title, author)
    @books << { 'title' => book.title, 'author' => book.author }
    @storage.add_data(@storage.book_path, @books, 'book')
    puts
    puts 'Book created successfully!'
    puts
  end

  def create_rental
    puts 'Select a book from the following list by the number on the left:'
    @books.each_with_index { |book, index| puts "#{index}. #{book['title']} by #{book['author']}" }
    book_number = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by the number on the left:'
    @person.each_with_index { |per, index| puts "#{index}. #{per['name']}" }
    person_number = gets.chomp.to_i
    date = ask_user('Date: ')
    person = Person.new(
      @person[person_number]['age'],
      name: @person[person_number]['name'],
      id: @person[person_number]['id']
    )
    book = Book.new(@books[book_number]['title'], @books[book_number]['author'])
    rental = Rental.new(date, book, person)
    @rentals << { date: rental.date, book: { title: rental.book.title, author: rental.book.author },
                  person: { id: rental.person.id, name: rental.person.name, age: rental.person.age } }
    @storage.add_data(@storage.rental_path, @rentals, 'rental')
    puts 'Rental created successfully!'
  end

  def list_all_rentals_by_given_id
    id = ask_user('Id: ').to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental['person']['id'] == id
        puts "Date: #{rental['date']}, Book \"#{rental['book']['title']}\" by #{rental['book']['author']}"
      end
    end
  end

  def ask_user(str)
    puts str
    gets.chomp
  end
end
