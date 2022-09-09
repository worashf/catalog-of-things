require_relative 'helpers/menu'
require_relative 'helpers/create_book'
require_relative 'helpers/create_game'
require_relative 'helpers/create_movie'
require_relative 'helpers/create_music_album'
require_relative 'helpers/display/list_book'
require_relative 'helpers/display/list_movie'
require_relative 'helpers/display/list_game'
require_relative 'helpers/display/list_music_album'
require_relative 'helpers/display/list_genre'
require_relative 'helpers/display/list_label'
require_relative 'helpers/display/list_source'
require_relative 'helpers/display/list_author'
require_relative 'helpers/preserve/storage'
require_relative 'options/list_add_option'

class App
  include ListAddOption
  def initialize
    @books = []
    @games = []
    @movies = []
    @music_albums = []
    @authors = []
    @genres = []
    @labels = []
    @sources = []
    load_data
  end

  def load_data
    @authors = CreateAuthor.create_object(Storage.new('authors').load_data)
    @labels = CreateLabel.create_object(Storage.new('labels').load_data)
    @sources = CreateSource.create_object(Storage.new('sources').load_data)
    @genres = CreateGenre.create_object(Storage.new('genres').load_data)
    @books = CreateBook.create_object(Storage.new('books').load_data, @authors, @labels, @genres, @sources)
    @games = CreateGame.create_object(Storage.new('games').load_data, @authors, @labels, @genres, @sources)
    @movies = CreateMovie.create_object(Storage.new('movies').load_data, @authors, @labels, @genres, @sources)
    @music_albums = CreateMusicAlbum.create_object(Storage.new('music_albums').load_data, @authors, @labels, @genres,
                                                   @sources)
  end

  def quit
    Storage.new('books').save(@books)
    Storage.new('labels').save(@labels)
    Storage.new('genres').save(@genres)
    Storage.new('music_albums').save(@music_albums)
    Storage.new('authors').save(@authors)
    Storage.new('games').save(@games)
    Storage.new('sources').save(@sources)
    Storage.new('movies').save(@movies)
    exit
  end

  def display_menu
    menu = Menu.new
    menu.list_menu
    selected_menu = gets.chomp.to_i
    if [*1..4].include? selected_menu
      listing_child_option(selected_menu)
    elsif [*5..8].include? selected_menu
      listing_parent_option(selected_menu)
    elsif [*9..12].include? selected_menu
      adding_option(selected_menu)
    elsif selected_menu == 13
      quit
    else
      puts 'Invald options'
    end
  end

  private

  def add_new_book
    book = CreateBook.add
    @books << book
    @labels << book.label
    @sources << book.source
    @genres << book.genre
    @authors << book.author
  end

  def add_new_game
    game = CreateGame.add
    @games << game
    @labels << game.label
    @sources << game.source
    @genres << game.genre
    @authors << game.author
  end

  def add_new_movie
    movie = CreateMovie.add
    @movies << movie
    @labels << movie.label
    @sources << movie.source
    @genres << movie.genre
    @authors << movie.author
  end

  def add_new_music_album
    music_album = CreateMusicAlbum.add
    @music_albums << music_album
    @labels << music_album.label
    @sources << music_album.source
    @genres << music_album.genre
    @authors << music_album.author
  end

  def list_books
    ListBook.display(@books)
  end

  def list_games
    ListGame.display(@games)
  end

  def list_movies
    ListMovie.display(@movies)
  end

  def list_music_albums
    ListMusicAlbum.display(@music_albums)
  end

  def list_authors
    ListAuthor.display(@authors)
  end

  def list_genres
    ListGenre.display(@genres)
  end

  def list_sources
    ListSource.display(@sources)
  end

  def list_labels
    ListLabel.display(@labels)
  end
end
