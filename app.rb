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
    # @people = @storage.hash_data.map{|key,value| if [:person].include? (key) }.compact
    # puts @people
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No added book!'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    # if @people.empty?
    #   puts 'No added person!'
    #   puts
    # else
    #   @people.each_with_index do |person, index|
    #     puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    #   end
    # end

    @storage.hash_data.each do |key, value|
      value.each {|key2, value2| puts key2["name"] } 
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    @people.push(Student.new(classroom, age, name: name, parent_permission: parent_permission))
    puts
    puts 'Student created successfuly!'
    puts
    @option.main.methods_list
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name: name))
    puts
    puts 'Teacher created successfuly!'
    puts
    @option.main.methods_list
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by the number on the left'
    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by the number on the left'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_number], @people[person_number]))
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
