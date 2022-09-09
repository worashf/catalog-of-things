module ListAddOption
  def listing_child_option(option)
    loop do
      case option
      when 1
        list_books
        display_menu
      when 2
        list_music_albums
        display_menu
      when 3
        list_movies
        display_menu
      when 4
        list_games
        display_menu
      end
    end
  end

  def listing_parent_option(option)
    loop do
      case option
      when 5
        list_genres
        display_menu
      when 6
        list_labels
        display_menu
      when 7
        list_authors
        display_menu
      when 8
        list_sources
        display_menu
      end
    end
  end

  def adding_option(option)
    loop do
      case option
      when 9
        add_new_book
        display_menu
      when 10
        add_new_music_album
        display_menu
      when 11
        add_new_game
        display_menu
      when 12
        add_new_movie
        display_menu
      end
    end
  end
end
