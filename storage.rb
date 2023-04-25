require 'json'

class Storage

  attr_accessor :hash_data

  def initialize
    @hash_data = {}
    dir = File.dirname(__FILE__)
    file_name = 'data.json'
    @full_path = File.join(dir, file_name)
  end

  def open_file(mode)
    File.open(@full_path, mode)
  end

  def add_person(object)
    file = open_file('r')
    puts file
  end

  def get_data
    file = open_file('r')
    file.read
  end

  def json_to_hash
    str = get_data
    @hash_data = JSON(str)
  end
    
end

# storage = Storage.new()
# storage.json_to_hash
# puts storage.hash_data