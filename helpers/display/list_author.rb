require_relative '../list'

class ListAuthor < List
  def self.display(authors)
    puts 'No authors available' if authors.empty?
    authors.each do |author|
      puts "author id:#{author.id}\t, first name : #{author.first_name}, last name: #{author.last_name}"
    end
  end
end
