require_relative 'list'
class ListBook < List
  def self.display(books)
    puts 'No book available' if books.empty?
    books.each do |book|
      book_status = book.archived ? 'Archived' : 'Not Archived'
      label = book.label.title
      source = book.source.name
      genre = book.genre.name
      author = book.author.first_name
      puts "book id: #{book.id},  label: #{label},  source: #{source}, genre: #{genre}"
      puts "author: #{author},  published date : #{book.published_date},  archvied status : #{book_status}"
    end
  end
end
