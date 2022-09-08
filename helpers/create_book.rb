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

  def self.create_object(books, authors, labels, genres, sources)
    books.map do |book|
      new_book = Book.new(book[:publisher], book[:cover_state],
                          book[:published_date], archived: book[:archived], id: book[:id])
      label = labels.find { |l| l.id == book[:label_id] }
      new_book.label = label
      source = sources.find { |s| s.id == book[:source_id] }
      new_book.source = source
      genre = genres.find { |g| g.id == book[:genre_id] }
      new_book.genre = genre
      author = authors.find { |au| au.id == book[:author_id] }
      new_book.author = author
      new_book
    end
  end
end
