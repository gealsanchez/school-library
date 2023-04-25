require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize(option)
    @option = option
    @storage = @option.menu.storage
    @storage.json_to_hash
    @books = []
    @rentals = []
  end

  def list_all_books
    @storage.hash_data.each do |key, value|
      if( key == "book")
        value.each { |elem| puts "Title: #{elem["title"]} Author: #{elem["author"]}" }
      end
    end
  end

  def list_all_people
    @storage.hash_data.each do |key, value|
      if( key == "person")
        value.each { |elem| puts "Id: #{elem["id"]} Name: #{elem["name"]} age: #{elem["age"]} type: #{elem["type"]}" }
      end
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    student1 = Student.new("B1", age, name: name, parent_permission: parent_permission)
    @storage.hash_data["person"] << {id: student1.id, name: student1.name, age: student1.age, parent_permission: true}
    @storage.add_data
    puts
    puts 'Student created successfuly!'
    puts
    @option.menu.methods_list
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher1 = Teacher.new(age, specialization, name: name)
    @storage.hash_data["person"] << {id: teacher1.id, name: teacher1.name, age: teacher1.age, specialization: teacher1.specialization}
    @storage.add_data
    puts
    puts 'Teacher created successfuly!'
    puts
    @option.menu.methods_list
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book1 = Book.new(title, author)
    @storage.hash_data["book"] << {title: book1.title, author: book1.author}
    @storage.add_data
    puts
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by the number on the left'

    @storage.hash_data.each do |key, value|
      if( key == "book")
        value.each_with_index { |elem, index| puts "#{index}) Title: #{elem["title"]} Author: #{elem["author"]}" }
      end
    end
    book_number = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by the number on the left'
    @storage.hash_data.each do |key, value|
      if( key == "person")
        value.each_with_index { |elem, index| puts "#{index}) Name: #{elem["name"]}" }
      end
    end
    person_number = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    person1 = Person.new(
      @storage.hash_data["person"][person_number]["age"],
      name: @storage.hash_data["person"][person_number]["name"]
    )
    book1 = Book.new(
      @storage.hash_data["book"][book_number]["title"],
      @storage.hash_data["book"][book_number]["author"]
    )
    rental1 = (Rental.new(date, book1, person1))
    @storage.hash_data["rental"] << {date: rental1.date, book: {title: rental1.book.title, author: rental1.book.author}, person: {id: rental1.person.id, name: rental1.person.name, age: rental1.person.age}}
    @storage.add_data
    puts 'Rental created successfully!'
  end

  def list_all_rentals_by_given_id
    print 'Person ID: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
