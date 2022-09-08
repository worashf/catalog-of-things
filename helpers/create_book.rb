require_relative 'create'
require './lib/book'
require_relative 'create_genre'
require_relative 'create_label'
require_relative 'create_source'
require_relative 'create_author'

class CreateBook < Create
  def self.add
    label = CreateLabel.add
    source = CreateSource.add
    author = CreateAuthor.add
    genre = CreateGenre.add

    puts ' Enter book publisher: '
    publisher = gets.chomp.strip
    puts 'Enter book cover state :'
    cover_state = gets.chomp.strip
    puts 'Enter published date: '
    published_date = gets.chomp.strip

    book = Book.new(publisher, cover_state, published_date)
    book.label = label
    book.author = author
    book.source = source
    book.genre = genre
    puts 'Book created seccussfuly' unless book.nil?
    book
  end
end
