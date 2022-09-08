require_relative '../list'

class ListBook < List
  def self.display(books)
    puts 'No book available' if books.empty?
    books.each do |book|
      book_status = book.archived ? 'Archived' : 'Not Archived'
      label = book.label.title || 'No label'
      source = book.source.name || 'No source'
      genre = book.genre.name || 'No genre'
      author = book.author.first_name || 'No author'
      puts "book id:#{book.id}\t,label: #{label} \n source: #{source}\t genre: #{genre} \t author: #{author} \n published date : #{book.published_date} \n  archvied status : #{book_status}"
    end
  end
end
