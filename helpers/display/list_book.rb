require_relative 'list'
class ListBook < List
  def self.display(books)
    puts 'No book available' if books.empty?
    books.each do |book|
      book_status = book.archived ? 'Archived' : 'Not Archived'
      puts "book id: #{book.id},  published date : #{book.published_date},  archvied status : #{book_status}"
    end
  end
end
