class Menu
  def list_menu
    puts "----------------------------------------------\n"
    puts 'WELCOME TO CATALOG OF THINGS'
    puts "----------------------------------------------\n\n"
    puts 'Please choose an option by entering a number:'
    menu_options.each do |menu|
      puts menu
    end
  end

  private

  def menu_options
    options = [
      '1 => List all books', '2 => List all  music albums',
      '3 => List all movies', '4 => List all games', '5 => List all genres',
      '6 => List all labels', '7 => List all authors', '8 => List all sources',
      '9 => Add book', '10 => Add music album', '11 => Add games', '12 => Add movie', '13 => Quit'
    ]
  end
end
