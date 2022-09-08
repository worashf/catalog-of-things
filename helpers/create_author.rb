require_relative 'create'
require './lib/author'

class CreateAuthor < Create
  def self.add
    puts '---- Add author information -----'
    puts 'First Name: '
    first_name = gets.chomp.strip
    puts 'Last Name: '
    last_name = gets.chomp.strip

    author = Author.new(first_name, last_name)
    puts 'Author created seccussfuly' unless author.nil?

    author
  end

  def self.create_object(authors)
    authors.map do |author|
      Author.new(author[:file_name], author[:last_name], id: author[:id])
    end
  end
end
