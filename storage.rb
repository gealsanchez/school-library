require 'json'
require 'pry'

class Storage
  attr_accessor :person, :book, :rental
  attr_reader :person_path, :book_path, :rental_path

  def initialize
    @person = []
    @book = []
    @rental = []
    dir = File.dirname(__FILE__)
    file_person = 'person.json'
    file_book = 'book.json'
    file_rental = 'rental.json'
    @person_path = File.join(dir, file_person)
    @book_path = File.join(dir, file_book)
    @rental_path = File.join(dir, file_rental)
  end

  def open_file(path, key)
    if (File.exist?(path) && !File.zero?(path))
      file = File.open(path, 'r')
      str = file.read
      aux_hash = JSON(str)
      if(key == "person")
        @person = aux_hash[key]
      end
      if(key == "book")
        @book = aux_hash[key]
      end
      if(key == "rental")
        @rental = aux_hash[key]
      end
    else
      puts key
      create_file(path, key)
    end
  end

  def create_file(path, key)
    if(key == "person")
      File.write(path, '{"person" : []}')
    elsif (key == "book")
      File.write(path, '{"book" : []}')
    elsif (key == "rental")
      File.write(path, '{"rental" : []}')
    end
  end

  def add_data(path, target, key)
    file = File.open(path, 'w')
    hash = {key => target}
    str = JSON(hash)
    File.write(path, str)

  end

  def acquire_data
    open_file(@person_path, "person")
    open_file(@book_path, "book")
    open_file(@rental_path, "rental")
  end

end

