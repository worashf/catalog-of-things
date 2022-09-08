require_relative 'list'

class ListLabel < List
  def self.display(labels)
    puts 'No labels available' if labels.empty?
    labels.each do |label|
      puts "label id: #{label.id},  title: #{label.title}, color: #{label.color}"
    end
  end
end
