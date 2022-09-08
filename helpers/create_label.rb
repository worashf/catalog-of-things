require './lib/label'
require_relative 'create'

class CreateLabel < Create
  def self.add
    puts '---- Add label information -----'
    puts 'Enter Label Title: '
    title = gets.chomp.strip
    puts 'Enter Label Color: '
    color = gets.chomp.strip
    label = Label.new(title, color)
    puts 'Label created seccussfuly' unless label.nil?
    label
  end
end
