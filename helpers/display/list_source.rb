require_relative '../list'

class ListSource < List
  def self.display(sources)
    puts 'No sources available' if sources.empty?
    sources.each do |source|
      puts "source id:#{source.id}\t,  name : #{source.name}"
    end
  end
end
